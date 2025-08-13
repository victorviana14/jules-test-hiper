import 'package:flutter/material.dart';

class CancellationScreen extends StatelessWidget {
  const CancellationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancelamentos'),
      ),
      body: const Center(
        child: Text('Tela de Cancelamentos'),
      ),
    );
  }
}
