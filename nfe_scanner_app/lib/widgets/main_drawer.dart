import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool _isExpanded = true;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: _isExpanded ? 250 : 70,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[900], // Darker header
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [\n
                  // Toggle button for expand/collapse
                  Align(
                    alignment: _isExpanded ? Alignment.centerRight : Alignment.center,
                    child: IconButton(
                      icon: Icon(
                        _isExpanded ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: _toggleExpand,
                      tooltip: _isExpanded ? 'Collapse' : 'Expand',
                    ),
                  ),
                  if (_isExpanded)
                    const Text(
                      'NFe Scanner',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: _isExpanded ? const Text('Ciência da Operação') : null,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/operation-science');
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: _isExpanded ? const Text('Cancelamentos') : null,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/operation-science');
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: _isExpanded ? const Text('Cancelamentos') : null,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/cancellations');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.security),
              title: _isExpanded ? const Text('Certificado Digital') : null,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/digital-certificate');
              },
            ),
            // A lógica de visibilidade será adicionada posteriormente com base no perfil do usuário
            ListTile(
              leading: const Icon(Icons.people),
              title: _isExpanded ? const Text('Gerenciamento de Usuários') : null,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/user-management');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: _isExpanded ? const Text('Logout') : null,
              onTap: () {
                // Lógica de logout
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String routeName, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white54),
      title: _isExpanded ? Text(title, style: const TextStyle(color: Colors.white70)) : null,
      onTap: () {
        // Fecha o drawer e navega
        Navigator.pop(context);
        if (isLogout) {
          Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
        } else {
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
    );
  }
}
