import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class OperationScienceScreen extends StatelessWidget {
  const OperationScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ciência da Operação'),
      ),
      drawer: isLargeScreen ? null : const MainDrawer(), // Use drawer on small screens
      body: Row(
        children: [
          // Display the MainDrawer persistently on large screens
          if (isLargeScreen) const MainDrawer(),
          Expanded(
            child: Center(
              child: const Text('Tela de Ciência da Operação'),
            ),
          ),
        ],
      ),
    );
  }
}
