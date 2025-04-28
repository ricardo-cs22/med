import 'package:flutter/material.dart';

class EstoqueList extends StatelessWidget {
  final List<dynamic> medicamentos;

  const EstoqueList({super.key, required this.medicamentos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: medicamentos.map((med) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.asset(med["imagem"]?? '',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.medical_services, size: 50, color: Colors.grey),),
              title: Text(med["nome"], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("quantidade em estoque"+med["estoque"]),
              
              
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getStatusColor(String colorName) {
    switch (colorName) {
      case "red":
        return Colors.red;
      case "green":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
