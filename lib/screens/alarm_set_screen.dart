import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/alarm_controller.dart';

class AlarmSetScreen extends StatefulWidget {
  const AlarmSetScreen({Key? key}) : super(key: key);

  @override
  State<AlarmSetScreen> createState() => _AlarmSetScreenState();
}

class _AlarmSetScreenState extends State<AlarmSetScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _estoqueController = TextEditingController();
  final TextEditingController _diasAtivosController = TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();
  final TextEditingController _imagemController = TextEditingController(
    text: "https://via.placeholder.com/50",
  );

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Alarme'),
        backgroundColor: const Color(0xFF5B8DEE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do Remédio',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _estoqueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade em Estoque',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _diasAtivosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Dias que o alarme vai funcionar',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              title: Text('Horário: ${_selectedTime.format(context)}'),
              trailing: const Icon(Icons.access_time),
              onTap: () => _selectTime(context),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {
    final nome = _nomeController.text.trim();
    final estoque = _estoqueController.text.trim();
    final diasAtivos = int.tryParse(_diasAtivosController.text.trim()) ?? 0;
    final horario = _selectedTime.format(context);
    final imagem = _imagemController.text.trim();

    if (nome.isNotEmpty && estoque.isNotEmpty && diasAtivos > 0) {
      Provider.of<AlarmController2>(context, listen: false).addAlarm({
        'nome': nome,
        'imagem': imagem,
        'horario': horario,
        'diasAtivos': diasAtivos,
        'status': 'Ativo',
        'estoque': estoque,
      }, nome:nome, imagem: 'assets/download (1).jpg', horario: horario, diasAtivos:  diasAtivos, estoque: estoque );

      Navigator.pop(context);
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF5B8DEE),
    minimumSize: const Size(double.infinity, 50),
  ),
  child: const Text('Salvar Alarme'),
),
          ],
        ),
      ),
    );
  }
}
