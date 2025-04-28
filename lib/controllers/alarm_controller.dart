import 'package:medtimer/model/AlarmModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:flutter/material.dart';

class AlarmController2 extends ChangeNotifier {
  List<Map<String, dynamic>> _alarms = [];

  List<Map<String, dynamic>> get alarms => _alarms;

  void addAlarm(Map<String, Object> newAlarm, {
    required String nome,
    required String imagem,
    required String horario,
    required int diasAtivos,
    required String estoque,
  }) {
    final newAlarm = {
      "id": DateTime.now().millisecondsSinceEpoch,
      "nome": nome,
      "imagem": imagem,
      "horario": horario,
      "diasAtivos": diasAtivos,
      "estoque": estoque,
      "status": "Ativo",
      "corStatus": "green",
    };

    _alarms.add(newAlarm);
    notifyListeners();
  }

  void removeAlarm(int index) {
  alarms.removeAt(index);
  notifyListeners();
}


  

}


// class AlarmController {
//   final List<AlarmModel> _alarms = [
//     // Exemplo de alarme pré-criado (pode deixar vazio se quiser)
//     AlarmModel(
//       id: 1,
//       nome: 'Dipirona',
//       imagem: 'https://via.placeholder.com/50',
//       horario: '08:00',
//       diasAtivos: 10,
//       estoque: 5, status: ''
//       , corStatus: '',
//     ),
//   ];

//   // Getter para acessar os alarmes
//   List<AlarmModel> get alarms => _alarms;

//   // Adicionar novo alarme
//   void addAlarm(AlarmModel alarm) {
//     _alarms.add(alarm);
//   }

//   // Remover alarme pelo ID
//   void removeAlarm(int id) {
//     _alarms.removeWhere((alarm) => alarm.id == id);
//   }

//   // Atualizar um alarme existente
//   void updateAlarm(AlarmModel updatedAlarm) {
//     int index = _alarms.indexWhere((alarm) => alarm.id == updatedAlarm.id);
//     if (index != -1) {
//       _alarms[index] = updatedAlarm;
//     }
//   }
// }





// class AlarmController2 extends ChangeNotifier {
//   List<Map<String, dynamic>> _alarms = [];
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   List<Map<String, dynamic>> get alarms => _alarms;

//   AlarmController() {
//     initializeNotifications();
//     loadAlarms();
//   }

//   Future<void> initializeNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> addAlarm(Map<String, dynamic> alarm) async {
//     _alarms.add(alarm);
//     notifyListeners();
//     await saveAlarms();
//     scheduleAlarmNotification(alarm);
//   }

//   Future<void> saveAlarms() async {
//     final prefs = await SharedPreferences.getInstance();
//     final alarmsJson = jsonEncode(_alarms);
//     await prefs.setString('alarms', alarmsJson);
//   }

//   Future<void> loadAlarms() async {
//     final prefs = await SharedPreferences.getInstance();
//     final alarmsJson = prefs.getString('alarms');
//     if (alarmsJson != null) {
//       final List<dynamic> decoded = jsonDecode(alarmsJson);
//       _alarms = decoded.map((item) => item as Map<String, dynamic>).toList();
//       notifyListeners();
//     }
//   }

//  Future<void> scheduleAlarmNotification(Map<String, dynamic> alarm) async {
//   final timeParts = alarm['horario'].split(":");
//   final int hour = int.parse(timeParts[0]);
//   final int minute = int.parse(timeParts[1]);
//   final int days = alarm['diasAtivos'] ?? 1;

//   final now = DateTime.now();
//   DateTime firstTrigger = DateTime(now.year, now.month, now.day, hour, minute);

//   if (firstTrigger.isBefore(now)) {
//     firstTrigger = firstTrigger.add(const Duration(days: 1));
//   }

//   for (int i = 0; i < days; i++) {
//     final scheduleDate = firstTrigger.add(Duration(days: i));
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       scheduleDate.hashCode, // ID ÚNICO
//       'Hora do Remédio',
//       'Tomar ${alarm['nome']}',
//       tz.TZDateTime.from(scheduleDate, tz.local), // ✅ aqui está o segundo argumento
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'alarm_channel',
//           'Alarmes',
//           channelDescription: 'Notificações de alarmes de remédios',
//           importance: Importance.max,
//           priority: Priority.high,
//           playSound: true,
//           icon: '@mipmap/ic_launcher',
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time, // repetir a cada dia no mesmo horário
//     );
//   }
// }



// }