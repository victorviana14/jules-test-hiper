import 'package:flutter/material.dart';
import 'package:nfe_scanner_app/screens/company_selection_screen.dart';
import 'package:nfe_scanner_app/screens/dashboard_screen.dart';
import 'package:nfe_scanner_app/screens/login_screen.dart';
import 'package:nfe_scanner_app/screens/operation_science_screen.dart';
import 'package:nfe_scanner_app/screens/cancellation_screen.dart';
import 'package:nfe_scanner_app/screens/digital_certificate_screen.dart';
import 'package:nfe_scanner_app/screens/user_management_screen.dart';
import 'package:nfe_scanner_app/widgets/main_drawer.dart';

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
        '/nfe-list': (context) => const OperationScienceScreen(),
        '/operation-science': (context) => const OperationScienceScreen(),
        '/cancellations': (context) => const CancellationScreen(),
        '/digital-certificate': (context) => const DigitalCertificateScreen(),
        '/user-management': (context) => const UserManagementScreen(),
      },
    );
  }
}
