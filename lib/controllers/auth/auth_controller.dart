import 'package:flutter/material.dart';
import '../../data/app_data.dart';
import '../../screens/home_screen.dart';

class AuthController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void login(BuildContext context) {
    String email = emailController.text.trim();
    String senha = senhaController.text.trim();

    Map<String, dynamic>? usuario;

    try {
      usuario = (appData['usuarios'] as List)
          .cast<Map<String, dynamic>>()
          .firstWhere(
            (user) => user['email'] == email && user['senha'] == senha,
          );
    } catch (e) {
      usuario = null;
    }

    if (usuario != null) {
      // Usuário autenticado com sucesso
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Exibir erro se a autenticação falhar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email ou senha inválidos")),
      );
    }
  }
}
