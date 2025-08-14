import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class NFe {
  final String id;
  final String emitter; // Emitente
  final String number;
  final String series;
  final DateTime issueDate; // Data de Emissão
  final double value;
  bool isSelected;

  NFe({
    required this.id,
    required this.emitter,
    required this.number,
    required this.series,
    required this.issueDate,
    required this.value,
    this.isSelected = false,
  });
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Lista de exemplo - será substituída por dados da API
  final List<NFe> _nfeList = List.generate(
    20,
    (index) => NFe(
      id: index.toString(),
      emitter: 'Empresa Exemplo ${index + 1}',
      number: (1000 + index).toString(),
      series: '1',
      issueDate: DateTime.now().subtract(Duration(days: index)),
      value: (index + 1) * 150.75,
    ),
  );

  bool _isSelectionMode = false;
  int _selectedCount = 0;

  void _toggleSelectionMode() {
    setState(() {
      _isSelectionMode = !_isSelectionMode;
      // Limpa a seleção ao sair do modo de seleção
      if (!_isSelectionMode) {
        for (var nfe in _nfeList) {
          nfe.isSelected = false;
        }
        _selectedCount = 0;
      }
    });
  }

  void _onNFeSelected(NFe nfe) {
    setState(() {
      nfe.isSelected = !nfe.isSelected;
      if (nfe.isSelected) {
        _selectedCount++;
      } else {
        _selectedCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isLargeScreen = screenWidth > 600;

    Widget mainContent = Scaffold(
      appBar: AppBar(
        title: Text(_isSelectionMode ? '$_selectedCount selecionada(s)' : 'Dashboard - NF-es'),
        actions: _isSelectionMode
            ? <Widget>[
                IconButton(
                  icon: const Icon(Icons.download),
                  tooltip: 'Baixar XMLs',
                  onPressed: () {
                    // Lógica para baixar XMLs selecionados
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.picture_as_pdf),
                  tooltip: 'Baixar DANFEs',
                  onPressed: () {
                    // Lógica para baixar DANFEs selecionados
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: _toggleSelectionMode,
                ),
              ]
            : <Widget>[
                // Ícone para ativar o modo de seleção, pode ser adicionado se preferir
              ],
      ),
      // The drawer is handled outside of the Scaffold for large screens
      drawer: isLargeScreen ? null : const MainDrawer(),
      body: ListView.builder(
        itemCount: _nfeList.length,
        itemBuilder: (context, index) {
          final nfe = _nfeList[index];
          return Card(
            color: nfe.isSelected ? Colors.blue.withOpacity(0.2) : null,
            child: ListTile(
              leading: _isSelectionMode
                  ? Checkbox(
                      value: nfe.isSelected,
                      onChanged: (bool? value) {
                        _onNFeSelected(nfe);
                      },
                    )
                  : const Icon(Icons.receipt),
              title: Text('${nfe.emitter} - N°: ${nfe.number}'),
              subtitle: Text(
                'Data: ${nfe.issueDate.toLocal().toString().split(' ')[0]} - Valor: R\$ ${nfe.value.toStringAsFixed(2)}',
              ),
              onTap: () {
                if (_isSelectionMode) {
                  _onNFeSelected(nfe);
                } else {
                  // Lógica para ver detalhes da nota
                }
              },
              onLongPress: () {
                if (!_isSelectionMode) {
                  _toggleSelectionMode();
                  _onNFeSelected(nfe);
                }
              },
            ),
          );
        },
      ),
    ); // Removed the semicolon here as it's now part of a larger return statement

    if (isLargeScreen) {
      return Row(
        children: [
          const MainDrawer(), // Display the drawer persistently
          Expanded(child: mainContent), // Take the remaining space
        ],
      );
    }
    return mainContent; // For small screens, return the Scaffold with the drawer property
  }
}
