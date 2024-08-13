import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rukunsmart/features/billing/models/billing_model.dart';
import '../screens/payment_screen.dart';

class BillCard extends StatelessWidget {
  final Bill bill;

  const BillCard({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bill.description,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Amount: ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(bill.amount)}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              'Due Date: ${DateFormat('MMMM d, yyyy').format(bill.dueDate)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text('Status: ${bill.status.toString().split('.').last}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: bill.status == BillStatus.unpaid
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(bill: bill),
                        ),
                      );
                    }
                  : null,
              child:
                  Text(bill.status == BillStatus.unpaid ? 'Pay Now' : 'Paid'),
            ),
          ],
        ),
      ),
    );
  }
}
