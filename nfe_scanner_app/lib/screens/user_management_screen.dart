import 'package:flutter/material.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciamento de Usuários'),
      ),
      body: const Center(
        child: Text('Tela de Gerenciamento de Usuários'),
      ),
    );
  }
}
