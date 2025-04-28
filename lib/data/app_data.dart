const Map<String, dynamic> appData = {
  "usuarios": [
    {
      "id": 1,
      "nome": "João Palhano",
      "email": "joao@email.com",
      "senha": "123456",
      "fotoPerfil": "assets/logo,png"
    }
  ],
  "medicamentos": [
    {
      "id": 101,
      "nome": "Dipirona",
      "imagem": "assets/download (1).jpg",
      "horario": "19:33",
      "status": "Esqueceu",
      "corStatus": "red",
      "estoque": "5",
      "diasAtivos": 10 // <- Alarme por 10 dias seguidos
    },
    {
      "id": 102,
      "nome": "Buscopan",
      "imagem": "assets/download (1).jpg",
      "horario": "15:00",
      "status": "Tomado",
      "corStatus": "green",
      "estoque": "3",
      "diasAtivos": 5 // <- Alarme por 5 dias seguidos
    }
  ],
  "categorias": [
    {"icone": "people", "nome": "Cuidador", "rota": "/estoque"},
    {"icone": "inventory", "nome": "Estoque", "rota": "/estoque"},
    {"icone": "description", "nome": "Histórico", "rota": "/historico"},
    {"icone": "local_pharmacy", "nome": "Farmácias", "rota": "/estoque"},
    {"icone": "alarm", "nome": "Alarmes", "rota": "/agenda"},
    {"icone": "settings", "nome": "Configurações", "rota": "/estoque"}
  ]
};
