import 'package:flutter/material.dart';

class MedicamentosList extends StatelessWidget {
  final List medicamentos;
  const MedicamentosList({super.key, required this.medicamentos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: medicamentos.length,
      itemBuilder: (context, index) {
        final item = medicamentos[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.asset(item["imagem"]?? '',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.medical_services, size: 50, color: Colors.grey),),
            title: Text(item["nome"], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(item["horario"]),
            trailing: Text(
              item["status"],
              style: TextStyle(
                  color: item["corStatus"] == "green" ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
