import 'package:flutter/material.dart';

class DigitalCertificateScreen extends StatelessWidget {
  const DigitalCertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificado Digital'),
      ),
      body: const Center(
        child: Text('Tela de Gerenciamento de Certificado Digital'),
      ),
    );
  }
}
