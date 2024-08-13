import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        title: Text(
          "PENYULUHAN CEGAH STUNTING DAN RESIKO TINGGI PADA IBU HAMIL RW 12",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text("9/4/2023 13:44 WIB"),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.black,
        ),
        onTap: () {
          // Navigate to announcement details if needed
        },
      ),
    );
  }
}
