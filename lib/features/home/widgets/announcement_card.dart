import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.7),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          "PENYULUHAN CEGAH STUNTING DAN RESIKO TINGGI PADA IBU HAMIL RW 12",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Orbitron',
          ),
        ),
        subtitle:
            Text("9/4/2023 13:44 WIB", style: TextStyle(color: Colors.grey)),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.cyan,
        ),
        onTap: () {
          // Navigate to announcement details if needed
        },
      ),
    );
  }
}
