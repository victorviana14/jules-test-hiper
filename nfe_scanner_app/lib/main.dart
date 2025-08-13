import 'package:flutter/material.dart';
import 'package:nfe_scanner_app/screens/company_selection_screen.dart';
import 'package:nfe_scanner_app/screens/dashboard_screen.dart';
import 'package:nfe_scanner_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Varredor de NF-e',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/company-selection': (context) => const CompanySelectionScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
