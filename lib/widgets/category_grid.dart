import 'package:flutter/material.dart';

 

  

class CategoryGrid extends StatelessWidget {
  final List<dynamic> categorias;

  const CategoryGrid({super.key, required this.categorias});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        children: categorias.map((categoria) {
          return InkWell(
            onTap: () {
             Navigator.pushNamed(context, categoria["rota"]);
            },
            borderRadius: BorderRadius.circular(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFFF3F4F6),
                  child: Icon(
                    _getIcon(categoria["icone"]),
                    color: const Color(0xFF5B8DEE),
                    size: 30,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  categoria["nome"],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case "people":
        return Icons.people;
      case "inventory":
        return Icons.inventory;
      case "description":
        return Icons.description;
      case "local_pharmacy":
        return Icons.local_pharmacy;
      case "alarm":
        return Icons.alarm;
      case "settings":
        return Icons.settings;
      default:
        return Icons.help;
    }
  }
}
