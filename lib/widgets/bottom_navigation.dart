import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
        BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Agenda'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Histórico'),
        BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: 'Remédios'),
      ],
      onTap: onTap,
    );
  }
}
