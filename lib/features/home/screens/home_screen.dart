import 'package:flutter/material.dart';
import 'package:rukunsmart/features/home/widgets/announcement_card.dart';
import 'package:rukunsmart/features/home/widgets/menu_grid.dart';
import 'package:rukunsmart/features/home/widgets/region_info_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RukunSmart',
            style: TextStyle(fontFamily: 'Orbitron', fontSize: 24)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.cyan,
            onPressed: () {
              // Handle logout
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                AnnouncementCard(),
                SizedBox(height: 16),
                RegionInfoCard(),
                SizedBox(height: 16),
                MenuGrid(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.cyan),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone, color: Colors.cyan),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning, color: Colors.redAccent),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: Colors.cyan),
            label: 'Regions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, color: Colors.cyan),
            label: 'More',
          ),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
