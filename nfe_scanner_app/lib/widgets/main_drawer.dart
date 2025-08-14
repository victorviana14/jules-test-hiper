import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
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
            leading: const Icon(Icons.receipt_long),
            title: const Text('Ciência da Operação'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/operation-science');
            },
          ),
          ListTile(
            leading: const Icon(Icons.cancel),
            title: const Text('Cancelamentos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/cancellations');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Certificado Digital'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/digital-certificate');
            },
          ),
          // A lógica de visibilidade será adicionada posteriormente com base no perfil do usuário
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Gerenciamento de Usuários'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/user-management');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Lógica de logout
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
