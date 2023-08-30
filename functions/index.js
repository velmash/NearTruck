const { spawn } = require('child_process');

const functions = require('firebase-functions');
const express = require('express');

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/getTest', (req, res) => {
    res.send('윤형찬 API 서버');
});

// app.post('/calc', (req, res) => {
//     const num1 = req.body.num1;
//     const num2 = req.body.num2;
  
//     if (!num1 || !num2) {
//       res.status(400).send('파라미터가 정상적으로 수신되지 않음');
//       return;
//     }

//     const testProcess = spawn('python', ['./pyLogic/test.py', '3', '5']);
//     let result = '';
  
//     testProcess.stdout.on('data', (data) => {
//         result += data.toString();
//     });
  
//     testProcess.stderr.on('data', (data) => {
//       console.error(data.toString());
//     });
  
//     testProcess.on('close', (code) => {
//       if (code === 0) {
//         const asd = String(result)
//         const resultObject = { "결과": asd };
//         const resultJSON = JSON.stringify(resultObject);
//         res.send(resultJSON);
//       } else {
//         res.status(500).send('test.py 실행 실패');
//       }
//     });
// });

app.use((req, res) => {
    res.status(404).send('올바른 요청 형식이 아닙니다.');
});

exports.api = functions.https.onRequest(app);