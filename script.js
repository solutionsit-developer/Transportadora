document.getElementById('contactForm').addEventListener('submit', async function(event) {
    event.preventDefault();

    const statusMessage = document.getElementById('statusMessage');
    statusMessage.style.display = 'none';

    const formData = {
        name: document.getElementById('name').value,
        email: document.getElementById('email').value,
        subject: document.getElementById('subject').value,
        message: document.getElementById('message').value
    };

    try {
        // Substitua 'SUA_URL_DO_BACKEND' pela URL do seu endpoint de back-end
        const response = await fetch('SUA_URL_DO_BACKEND/send-message', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        });

        if (response.ok) {
            statusMessage.textContent = 'Sua mensagem foi enviada com sucesso! Em breve entraremos em contato.';
            statusMessage.className = 'status-message success';
            document.getElementById('contactForm').reset();
        } else {
            const errorData = await response.json();
            statusMessage.textContent = `Erro ao enviar mensagem: ${errorData.message || 'Tente novamente.'}`;
            statusMessage.className = 'status-message error';
        }
    } catch (error) {
        statusMessage.textContent = 'Não foi possível conectar ao servidor. Verifique sua conexão ou tente mais tarde.';
        statusMessage.className = 'status-message error';
        console.error('Erro de rede ou servidor:', error);
    }
    statusMessage.style.display = 'block';
});