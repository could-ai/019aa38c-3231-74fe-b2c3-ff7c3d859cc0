import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel de Controle'),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.blueGrey[800]),
        titleTextStyle: TextStyle(
          color: Colors.blueGrey[800],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: _getCrossAxisCount(context),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: <Widget>[
            _buildDashboardCard(
              context,
              icon: Icons.timer_outlined,
              label: 'Registrar Ponto',
              onTap: () { /* Navegar para tela de registro */ },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.history,
              label: 'Meus Registros',
              onTap: () { /* Navegar para tela de espelho de ponto */ },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.bar_chart,
              label: 'Relatórios',
              onTap: () { /* Navegar para tela de relatórios */ },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.people_outline,
              label: 'Funcionários',
              onTap: () { /* Navegar para tela de gestão de funcionários */ },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.edit_calendar_outlined,
              label: 'Justificativas',
              onTap: () { /* Navegar para tela de justificativas */ },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.settings_outlined,
              label: 'Configurações',
              onTap: () { /* Navegar para tela de configurações */ },
            ),
          ],
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return 4;
    } else if (screenWidth > 800) {
      return 3;
    } else {
      return 2;
    }
  }

  Widget _buildDashboardCard(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 48, color: Colors.blueGrey[700]),
            const SizedBox(height: 16),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Nome do Usuário'),
            accountEmail: const Text('usuario@empresa.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey[700],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Painel de Controle'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
