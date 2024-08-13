import 'package:flutter/material.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        MenuCard(
          icon: Icons.account_balance_wallet,
          label: 'Finance Details',
          onTap: () {
            // Handle navigation
          },
        ),
        MenuCard(
          icon: Icons.receipt,
          label: 'Monthly Bills',
          onTap: () {
            // Handle navigation
          },
        ),
        MenuCard(
          icon: Icons.newspaper,
          label: 'Community News',
          onTap: () {
            // Handle navigation
          },
        ),
        MenuCard(
          icon: Icons.warning,
          label: 'Emergency',
          color: Colors.red.shade400,
          onTap: () {
            // Handle emergency
          },
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const MenuCard({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.black87,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.7),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.cyan),
              const SizedBox(height: 8),
              Text(label,
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'Orbitron')),
            ],
          ),
        ),
      ),
    );
  }
}
