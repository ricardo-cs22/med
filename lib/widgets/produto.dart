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
              leading: Image.network(med["imagem"], width: 50, fit: BoxFit.cover),
              title: Text(med["nome"], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(med["estoque"]),
              trailing: Text(
                med["status"],
                style: TextStyle(color: _getStatusColor(med["corStatus"]), fontWeight: FontWeight.bold),
              ),
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
