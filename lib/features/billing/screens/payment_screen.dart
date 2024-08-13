import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/billing/bloc/billing_bloc.dart';
import 'package:rukunsmart/features/billing/bloc/billing_event.dart';
import 'package:rukunsmart/features/billing/models/billing_model.dart';
import '../widgets/receipt_upload.dart';

class PaymentScreen extends StatelessWidget {
  final Bill bill;

  const PaymentScreen({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${bill.description}'),
            Text('Amount: ${bill.amount}'),
            Text('Due Date: ${bill.dueDate}'),
            const SizedBox(height: 24),
            const Text('Upload Payment Receipt:'),
            ReceiptUpload(
              onUpload: (String path) {
                context.read<BillingBloc>().add(UploadReceipt(bill.id, path));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
