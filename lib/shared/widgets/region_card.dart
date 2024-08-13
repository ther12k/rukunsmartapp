import 'package:flutter/material.dart';

class RegionCard extends StatelessWidget {
  const RegionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hutan Kota Residence',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('Code: RWCF3327'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Active Residents: 100'),
                ElevatedButton(
                  onPressed: () {
                    // Implement invite functionality
                  },
                  child: const Text('Invite Residents'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}