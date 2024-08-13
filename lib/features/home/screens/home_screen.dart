import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/announcement_card.dart';
import '../widgets/menu_grid.dart';
import '../widgets/region_info_card.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../finance/screens/finance_screen.dart';
import '../../billing/screens/billing_screen.dart';
import '../../news/screens/news_screen.dart';
import '../widgets/emergency_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RukunSmart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogoutRequested());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AnnouncementCard(),
              const SizedBox(height: 16),
              const RegionInfoCard(),
              const SizedBox(height: 16),
              MenuGrid(
                onFinanceDetailsTap: () =>
                    _navigateToScreen(context, const FinanceScreen()),
                onMonthlyBillsTap: () =>
                    _navigateToScreen(context, const BillingScreen()),
                onCommunityNewsTap: () =>
                    _navigateToScreen(context, const NewsScreen()),
                onEmergencyTap: () => _showEmergencyDialog(context),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone, color: Colors.black),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning, color: Colors.black),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: Colors.black),
            label: 'Regions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            label: 'More',
          ),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // TODO: Implement bottom navigation
        },
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Emergency'),
          content: const Text(
              'This is an emergency situation. Please confirm to proceed.'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToScreen(context, const EmergencyButton());
              },
            ),
          ],
        );
      },
    );
  }
}
