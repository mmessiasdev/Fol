const axios = require('axios');

module.exports = {
    lifecycles: {
        async afterCreate(result, data) {
            const notificationData = {
                app_id: "f49b725b-18ff-4f6e-b7b1-9bcadb116e48",
                contents: { "en": "Novo conteúdo adicionado! Confira agora as novidades no app." },
                included_segments: ["All"],
            };

            axios.post('https://onesignal.com/api/v1/notifications', notificationData, {
                headers: {
                    'Content-Type': 'application/json; charset=utf-8',
                    'Authorization': `Basic YjU2OWVlYmYtZTA2NS00ZGJhLWI0MDctNTQzMDA5MzljYzVj`,
                },
            })
                .then(response => {
                    console.log('Notificação enviada:', response.data);
                })
                .catch(error => {
                    console.error('Erro ao enviar notificação:', error);
                });
        },
    },
};