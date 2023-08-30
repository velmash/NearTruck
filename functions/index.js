const admin = require('firebase-admin');
const functions = require('firebase-functions');
const express = require('express');

admin.initializeApp();

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/getTest', (req, res) => {
    res.send('윤형찬 API 서버');
});

// Create (새로운 Man 추가)
app.post('/menCreate', (req, res) => {
    const { name, age } = req.body;
    const ref = admin.database().ref('/men');

    ref.once('value').then(snapshot => {
        let exists = false;

        snapshot.forEach(childSnapshot => {
            if (childSnapshot.val().name === name) {
                exists = true;
                return true;
            }
        });

        if (!exists) {
            ref.push({ name, age });
            res.status(201).send({ success: true });
        } else {
            res.status(400).send({ success: false, message: 'Name already exists' });
        }
    }).catch(error => {
        res.status(500).send('Error reading data');
    });
});

// Read (모든 Man 읽기)
app.get('/menRead', (req, res) => {
    const ref = admin.database().ref('/men');
    
    ref.once('value').then(snapshot => {
        const men = [];

        snapshot.forEach(childSnapshot => {
            men.push(childSnapshot.val());
        });

        res.send(men);
    }).catch(error => {
        res.status(500).send('Error reading data');
    });
});

// Update (Man의 나이 업데이트)
app.post('/men', (req, res) => {
    const { name, age } = req.body;
    const ref = admin.database().ref('/menUpdate');
    
    ref.once('value').then(snapshot => {
        snapshot.forEach(childSnapshot => {
            if (childSnapshot.val().name === name) {
                childSnapshot.ref.update({ age });
                res.send({ success: true });
                return true;
            }
        });

        res.status(404).send({ success: false, message: 'Name not found' });
    }).catch(error => {
        res.status(500).send('Error updating data');
    });
});

// Delete (Man 삭제)
app.post('/men', (req, res) => {
    const { name } = req.body;
    const ref = admin.database().ref('/men');
    
    ref.once('value').then(snapshot => {
        snapshot.forEach(childSnapshot => {
            if (childSnapshot.val().name === name) {
                childSnapshot.ref.remove();
                res.send({ success: true });
                return true;
            }
        });

        res.status(404).send({ success: false, message: 'Name not found' });
    }).catch(error => {
        res.status(500).send('Error deleting data');
    });
});

app.use((req, res) => {
    res.status(404).send('올바른 요청 형식이 아닙니다.');
});

exports.api = functions.https.onRequest(app);