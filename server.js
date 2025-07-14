require('dotenv').config();
const express = require('express');
const nodemailer = require('nodemailer');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

const transporter = nodemailer.createTransport({
    service: 'gmail', // Ou configure host e port para outros serviços
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS
    }
});

app.post('/send-message', async (req, res) => {
    const { name, email, subject, message } = req.body;

    if (!name || !email || !subject || !message) {
        return res.status(400).json({ message: 'Todos os campos são obrigatórios.' });
    }

    const mailOptions = {
        from: `"${name}" <${email}>`,
        to: process.env.EMAIL_USER, // E-mail dos desenvolvedores
        subject: `Mensagem de Contato: ${subject}`,
        html: `
            <h3>Nova Mensagem de Contato</h3>
            <p><strong>Nome:</strong> ${name}</p>
            <p><strong>Email:</strong> ${email}</p>
            <p><strong>Assunto:</strong> ${subject}</p>
            <p><strong>Mensagem:</strong><br>${message.replace(/\n/g, '<br>')}</p>
        `
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log('E-mail enviado com sucesso!');
        res.status(200).json({ message: 'Mensagem enviada com sucesso!' });
    } catch (error) {
        console.error('Erro ao enviar e-mail:', error);
        res.status(500).json({ message: 'Erro ao enviar a mensagem. Tente novamente mais tarde.' });
    }
});

app.listen(port, () => {
    console.log(`Servidor de back-end rodando em http://localhost:${port}`);
});