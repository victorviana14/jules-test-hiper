import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';


class CancellationScreen extends StatelessWidget {
  const CancellationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cancelamentos'),
          ),
          body: Builder( // Use a nested Builder here
            builder: (context) {
              if (constraints.maxWidth > 600) {
                return Row(
                  children: const [
                    MainDrawer(),
                    Expanded(
                      child: Center(
                        child: Text('Tela de Cancelamentos'),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text('Tela de Cancelamentos'),
                );
              }
            },
          ),
          drawer: constraints.maxWidth < 600 ? const MainDrawer() : null,
        );
      },
    );
  }
}
              child: Text('Tela de Cancelamentos'),
            );
          }
        },
      ),
      drawer: constraints.maxWidth < 600 ? const MainDrawer() : null,
    );
  }
}
