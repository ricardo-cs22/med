import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/alarm_controller.dart';
import 'alarm_set_screen.dart';
import '../widgets/header_widget.dart';

class AlarmListScreen extends StatelessWidget {
  const AlarmListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alarms = Provider.of<AlarmController2>(context).alarms;

    // Simulando dados do usuário para o Header
    final Map<String, dynamic> user = {
      "nome": "João Palhano",
      "fotoPerfil": "https://via.placeholder.com/150"
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HeaderWidget(user: user),
          Expanded(
            child: alarms.isEmpty
                ? const Center(
                    child: Text('Nenhum alarme adicionado ainda.'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: alarms.length,
                    itemBuilder: (context, index) {
                      final alarm = alarms[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 232, 231, 233),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                alarm['imagem'] ?? '',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.medical_services, size: 50, color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    alarm['nome'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'horario: ${alarm['horario']}',
                                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                                  ),Text(
                                    'dias ativo: ${alarm['diasAtivos']}',
                                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                Provider.of<AlarmController2>(context, listen: false).removeAlarm(index);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AlarmSetScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
