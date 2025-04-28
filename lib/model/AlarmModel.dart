class AlarmModel {
  final int id;
  final String nome;
  final String horario;
  final String imagem;
  final String status;
  final String corStatus;
  final int estoque;
  final int diasAtivos; // <- quantidade de dias que o alarme toca

  AlarmModel({
    required this.id,
    required this.nome,
    required this.horario,
    required this.imagem,
    required this.status,
    required this.corStatus,
    required this.estoque,
    required this.diasAtivos,
  });

  factory AlarmModel.fromJson(Map<String, dynamic> json) {
    return AlarmModel(
      id: json['id'],
      nome: json['nome'],
      horario: json['horario'],
      imagem: json['imagem'],
      status: json['status'],
      corStatus: json['corStatus'],
      estoque: int.parse(json['estoque']),
      diasAtivos: json['diasAtivos'] ?? 0, // <- Novo campo
    );
  }
}
