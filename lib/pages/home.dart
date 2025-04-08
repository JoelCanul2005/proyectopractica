import 'package:flutter/material.dart';
import 'add_cliente.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                width: double.infinity,
                child: const _MainCard(
                  icon: Icons.home,
                  label: 'EMPRESA',
                  color: Colors.blue,
                ),
              ),
              _buildRow(
                leftCard: const _MainCard(
                  icon: Icons.person_outline,
                  label: 'CLIENTES',
                  color: Colors.blue,
                ),
                rightCard: _SecondaryCard(
                  icon: Icons.person_outline,
                  label: 'Nuevo',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddCliente()),
                    );
                  },
                ),
              ),
              _buildRow(
                leftCard: const _MainCard(
                  icon: Icons.description_outlined,
                  label: 'ORDENES DE TRABAJO',
                  color: Colors.blue,
                  fontSize: 16,
                ),
                rightCard: const _SecondaryCard(
                  icon: Icons.description_outlined,
                  label: 'Nuevo',
                ),
              ),
              _buildRow(
                leftCard: const _MainCard(
                  icon: Icons.build_outlined,
                  label: 'ACTUACIONES',
                  color: Colors.blue,
                ),
                rightCard: const _SecondaryCard(
                  icon: Icons.build_outlined,
                  label: 'Nuevo',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.assignment, color: Colors.blueAccent, size: 24),
          ),
          const SizedBox(width: 8),
          const Text(
            'ORDEN DE TRABAJO',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildRow({required Widget leftCard, required Widget rightCard}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 16),
            child: leftCard,
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: rightCard,
          ),
        ),
      ],
    );
  }
}

class _MainCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final double fontSize;

  const _MainCard({
    required this.icon,
    required this.label,
    required this.color,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 36),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondaryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const _SecondaryCard({
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 36),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
