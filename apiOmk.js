import { auth } from './modules/auth.js';
import { pa } from './modules/authParams.js';

let a = new auth(pa);
let analyser;
let visualizer = document.querySelector('.visualizer');
let canvasCtx = visualizer.getContext('2d');

let audioPlayer = document.getElementById('audioPlayer');
let audioPreview = document.getElementById('audioPreview');

let recordButton = document.getElementById('recordButton');
let stopButton = document.getElementById('stopButton');
let deleteAudio = document.getElementById('deleteAudio');

let mediaRecorder;
let audioChunks = [];
let audioBlob = null;

a.getUser(u => {
    console.log("Utilisateur connecté :", u);

    if (!u || u.error) {
        alert("❌ Erreur de connexion à l'API OMK.\nVérifiez vos clés dans authParams.js");
        return;
    }
});

const CLASS_UNIVERSITY = 108;
const CLASS_COURSE = 109;
const CLASS_UNIV_COURSE = 110;
const CLASS_EVALUATION = 111;

const universitySelect = document.getElementById('university');
const courseSelect = document.getElementById('course');
let coursesMap = {};

async function loadResources() {
    let allCourses = await d3.json(`${a.apiOmk}items?resource_class_id=${CLASS_COURSE}`);
    allCourses.forEach(c => coursesMap[c['o:id']] = c['o:title']);

    let uc = await d3.json(`${a.apiOmk}items?resource_class_id=${CLASS_UNIV_COURSE}`);
    window.ucRelations = uc;

    let univ = await d3.json(`${a.apiOmk}items?resource_class_id=${CLASS_UNIVERSITY}`);
    univ.forEach(u => {
        let opt = document.createElement('option');
        opt.value = u['o:id'];
        opt.textContent = u['o:title'];
        universitySelect.appendChild(opt);
    });
}

universitySelect.addEventListener('change', () => {
    const univId = Number(universitySelect.value);

    courseSelect.innerHTML = '<option value="">-- Sélectionnez un cours --</option>';
    courseSelect.disabled = !univId;

    if (!univId) return;

    let relations = window.ucRelations.filter(uc =>
        uc['ex:offeredBy']?.some(v => Number(v.value_resource_id) === univId)
    );

    let list = [];
    relations.forEach(uc => {
        uc['ex:includesCourse']?.forEach(c => {
            let id = c.value_resource_id;
            if (coursesMap[id])
                list.push({ id, title: coursesMap[id] });
        });
    });

    list.forEach(c => {
        let opt = document.createElement('option');
        opt.value = c.id;
        opt.textContent = c.title;
        courseSelect.appendChild(opt);
    });
});

const commentRadios = document.querySelectorAll('input[name="commentType"]');
const writtenSection = document.getElementById('writtenCommentSection');
const audioSection = document.getElementById('audioCommentSection');

writtenSection.classList.add('d-block');
writtenSection.classList.remove('d-none');
audioSection.classList.add('d-none');
audioSection.classList.remove('d-block');

commentRadios.forEach(radio => {
    radio.addEventListener('change', async () => {
        if (radio.value === 'written') {
            writtenSection.classList.replace('d-none', 'd-block');
            audioSection.classList.replace('d-block', 'd-none');
        }
        if (radio.value === 'audio') {
            writtenSection.classList.replace('d-block', 'd-none');
            audioSection.classList.replace('d-none', 'd-block');

            if (!window.audioInitialized) {
                window.audioInitialized = true;
                await setupAudioRecording();
            }
        }
    });
});

async function setupAudioRecording() {
    try {
        const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
        mediaRecorder = new MediaRecorder(stream);

        const audioContext = new AudioContext();
        const source = audioContext.createMediaStreamSource(stream);
        analyser = audioContext.createAnalyser();
        analyser.fftSize = 2048;
        source.connect(analyser);

        setupVisualizer();

        mediaRecorder.ondataavailable = (event) => {
            audioChunks.push(event.data);
        };

        mediaRecorder.onstop = () => {
            audioBlob = new Blob(audioChunks, { type: 'audio/wav' });
            const audioUrl = URL.createObjectURL(audioBlob);
            audioPlayer.src = audioUrl;
            audioPreview.style.display = 'block';
            stopButton.disabled = true;
            recordButton.disabled = false;
            recordButton.classList.remove('recording');
        };

    } catch (error) {
        console.error('Erreur microphone:', error);
        alert('Microphone non disponible. Vérifiez les permissions.');
        document.getElementById('audioComment').disabled = true;
    }
}

function setupVisualizer() {
    const bufferLength = analyser.frequencyBinCount;
    const dataArray = new Uint8Array(bufferLength);

    function draw() {
        if (!analyser) return;

        requestAnimationFrame(draw);
        analyser.getByteTimeDomainData(dataArray);

        canvasCtx.fillStyle = 'black';
        canvasCtx.fillRect(0, 0, visualizer.width, visualizer.height);

        canvasCtx.lineWidth = 2;
        canvasCtx.strokeStyle = '#00ff00';
        canvasCtx.beginPath();

        const sliceWidth = visualizer.width * 1.0 / bufferLength;
        let x = 0;

        for (let i = 0; i < bufferLength; i++) {
            const v = dataArray[i] / 128.0;
            const y = v * visualizer.height / 2;

            if (i === 0) {
                canvasCtx.moveTo(x, y);
            } else {
                canvasCtx.lineTo(x, y);
            }
            x += sliceWidth;
        }

        canvasCtx.lineTo(visualizer.width, visualizer.height / 2);
        canvasCtx.stroke();
    }

    draw();
}

recordButton.addEventListener('click', () => {
    if (!mediaRecorder) {
        alert('Microphone non disponible');
        return;
    }

    audioChunks = [];
    mediaRecorder.start();
    recordButton.disabled = true;
    stopButton.disabled = false;
    recordButton.classList.add('recording');
});

stopButton.addEventListener('click', () => {
    if (mediaRecorder && mediaRecorder.state === 'recording') {
        mediaRecorder.stop();
    }
});

deleteAudio.addEventListener('click', () => {
    audioBlob = null;
    audioPreview.style.display = 'none';
    audioPlayer.src = '';
});

document.getElementById('evaluationForm').addEventListener('submit', async e => {
    e.preventDefault();
    console.log("Envoi de l'évaluation...");
    try {
        let year = document.getElementById('year').value;
        let rating = document.getElementById('rating').value;
        let courseId = Number(courseSelect.value);
        let commentType = document.querySelector('input[name="commentType"]:checked').value;

        let commentValue;

        if (commentType === 'written') {
            commentValue = document.getElementById('comment').value;
        } else {
            if (!audioBlob) {
                return showMsg("⚠️ Vous devez enregistrer un audio.", "danger");
            }
            let mediaId = await uploadAudio(audioBlob);
            commentValue = { rid: mediaId };
        }

        let data = {
            'o:resource_class': 'ex:Evaluation',
            'dcterms:title': `Évaluation - ${new Date().toLocaleString()}`,
            'ex:student': "anonyme",
            'ex:universityCourse': { rid: courseId },
            'ex:year': year,
            'ex:rating': rating,
            'ex:comment': commentValue,
            'ex:evaluationDate': new Date().toISOString()
        };

        a.omk.createItem(data, r => {
            showMsg("✅ Évaluation enregistrée avec succès !", "success");
            document.getElementById('evaluationForm').reset();
        });
    } catch (err) {
        console.error('Erreur:', err);
        showMsg(`⚠️ Erreur: ${err.message}`, "danger");
    }

});

async function uploadAudio(audioBlob) {
    const omk = a.omk;

    const itemData = {
        "dcterms:title": `Commentaire audio - ${new Date().toLocaleString('fr-FR')}`
    };

    const itemResult = await new Promise((resolve, reject) => {
        omk.createItem(itemData, (result) => {
            if (result && result['o:id']) {
                resolve(result);
            } else {
                reject(new Error('Erreur création item pour audio'));
            }
        });
    });

    const itemId = itemResult['o:id'];

    const formData = new FormData();
    formData.append('file[0]', audioBlob, `audio-${Date.now()}.wav`);

    const mediaPayload = {
        "o:ingester": "upload",
        "file_index": "0",
        "o:item": {
            "o:id": itemId
        }
    };

    formData.append('data', JSON.stringify(mediaPayload));

    const mediaResponse = await fetch(`${omk.api}media?key_identity=${omk.ident}&key_credential=${omk.key}`, {
        method: 'POST',
        body: formData
    });

    const mediaResult = await mediaResponse.json();

    if (!mediaResponse.ok) {
        await fetch(`${omk.api}items/${itemId}?key_identity=${omk.ident}&key_credential=${omk.key}`, {
            method: 'DELETE'
        });
        throw new Error(`Upload audio failed: ${JSON.stringify(mediaResult)}`);
    }

    return mediaResult['o:id'];
}

function showMsg(msg, type) {
    const div = document.getElementById('result');
    div.className = `alert alert-${type}`;
    div.textContent = msg;
    div.classList.remove('d-none');
}

const listContainer = document.getElementById('list');

async function loadEvaluations() {
    listContainer.innerHTML = '<p>Chargement des évaluations...</p>';

    const evaluations = a.omk.getAllItems(`resource_class_id[]=${CLASS_EVALUATION}`);

    if (!evaluations.length) {
        listContainer.innerHTML = '<p>Aucune évaluation trouvée.</p>';
        return;
    }

    const ul = document.createElement('ul');
    ul.className = 'list-group';

    for (let ev of evaluations) {
        const li = document.createElement('li');
        li.className = 'list-group-item';

        const title = ev['dcterms:title'] ? ev['dcterms:title'][0]['@value'] : 'Sans titre';
        const year = ev['ex:year'] ? ev['ex:year'][0]['@value'] : '';
        const rating = ev['ex:rating'] ? ev['ex:rating'][0]['@value'] : '';

        let courseTitle = '';
        if (ev['ex:universityCourse'] && ev['ex:universityCourse'][0].type === 'resource') {
            const courseId = ev['ex:universityCourse'][0].value_resource_id;
            const courseItem = a.omk.getItem(courseId);
            courseTitle = courseItem['o:title'] || '';
        }

        let commentHTML = '';
        if (ev['ex:comment'] && ev['ex:comment'][0]) {
            const c = ev['ex:comment'][0];
            if (c.type === 'resource') {
                const mediaId = c.value_resource_id;
                const media = a.omk.getMedia(mediaId); 
                const audioUrl = a.omk.getMediaLink(media['o:original_file']); 
                commentHTML = `<br/><audio controls src="${audioUrl}" class="w-25"></audio>`;
            } else {
                commentHTML = c['@value'];
            }
        }

        li.innerHTML = `<strong>${title}</strong> — Cours: ${courseTitle}, Année: ${year}, Note: ${rating} <br> Commentaire: ${commentHTML}`;

        ul.appendChild(li);
    }

    listContainer.innerHTML = '';
    listContainer.appendChild(ul);
}

document.getElementById('list-tab').addEventListener('click', loadEvaluations);

async function init() {
    await loadResources();
    console.log(a.omk.class.map(c => c['o:term']));
}

init();
