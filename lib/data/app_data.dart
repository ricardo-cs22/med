
const Map<String, dynamic> appData = {
  "usuarios": [
    {
      "id": 1,
      "nome": "João Palhano",
      "email": "joao@email.com",
      "senha": "123456",
      "fotoPerfil": "https://cdn.discordapp.com/attachments/1170901224397217884/1170948833740595270/image.png"
    }
  ],
  "medicamentos": [
    {
      "id": 101,
      "nome": "Dipirona",
      "imagem": "https://via.placeholder.com/50",
      "horario": "21/09/2023 - 19:33",
      
      "status": "Esqueceu",
      "corStatus": "red",
      "estoque": "5"
    },
    {
      "id": 102,
      "nome": "Buscopan",
      "imagem": "https://via.placeholder.com/50",
      "horario": "21/09/2023 - 15:00",
      "status": "Tomado",
      "corStatus": "green",
      "estoque": "3"
    }
  ],
  "categorias": [
    {"icone": "people", "nome": "Cuidador","rota": "/estoque"},
    {"icone": "inventory", "nome": "Estoque","rota": "/estoque"},
    {"icone": "description", "nome": "histórico","rota": "/historico"},
    {"icone": "local_pharmacy", "nome": "Farmácias","rota": "/estoque"},
    {"icone": "alarm", "nome": "Alarmes","rota": "/estoque"},
    {"icone": "settings", "nome": "Configurações","rota": "/estoque"}
  ]
};
   