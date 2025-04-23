import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recuperar Senha")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Digite seu e-mail para receber as instruções de recuperação de senha."),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: "E-mail"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("E-mail de recuperação enviado!")),
                );
                Navigator.pop(context);
              },
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
