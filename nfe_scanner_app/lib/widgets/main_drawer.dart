import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'NFe Scanner',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context); // Fecha o drawer
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
          ),
          ListTile(
            leading: const Icon(Icons.document_scanner),
            title: const Text('Varrer/Listar Notas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/nfe-list');
            },
          ),
          ListTile(
            leading: const Icon(Icons.science),
            title: const Text('Ciência da Operação'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/operation-science');
            },
          ),
          ListTile(
            leading: const Icon(Icons.cancel),
            title: const Text('Cancelamentos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cancellations');
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Certificado Digital'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/digital-certificate');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Gerenciamento de Usuários'),
            onTap: () {
               Navigator.pop(context);
               Navigator.pushNamed(context, '/user-management');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
