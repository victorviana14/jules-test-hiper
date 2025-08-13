import 'package:flutter/material.dart';

// A simple data model for a company
class _Company {
  final String id;
  final String name;
  final String cnpj;

  const _Company({required this.id, required this.name, required this.cnpj});
}

class CompanySelectionScreen extends StatefulWidget {
  const CompanySelectionScreen({super.key});

  @override
  State<CompanySelectionScreen> createState() => _CompanySelectionScreenState();
}

class _CompanySelectionScreenState extends State<CompanySelectionScreen> {
  bool _isLoading = true;
  final List<_Company> _companies = [];

  @override
  void initState() {
    super.initState();
    _fetchCompanies();
  }

  Future<void> _fetchCompanies() async {
    // Simulate a network request to fetch the list of companies
    await Future.delayed(const Duration(seconds: 1));

    // Mock data based on the project spec
    final mockData = [
      const _Company(id: '1', name: 'Empresa Exemplo 1', cnpj: '11.111.111/0001-11'),
      const _Company(id: '2', name: 'Filial de Testes 2', cnpj: '22.222.222/0001-22'),
      const _Company(id: '3', name: 'Matriz Principal', cnpj: '33.333.333/0001-33'),
    ];

    setState(() {
      _companies.addAll(mockData);
      _isLoading = false;
    });
  }

  void _selectCompany(_Company company) {
    // TODO: Pass the selected company info to the Dashboard
    // For example, using a state management solution or arguments
    Navigator.of(context).pushReplacementNamed('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione a Empresa'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _companies.length,
              itemBuilder: (context, index) {
                final company = _companies[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    title: Text(company.name),
                    subtitle: Text(company.cnpj),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => _selectCompany(company),
                  ),
                );
              },
            ),
    );
  }
}
