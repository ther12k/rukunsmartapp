import 'package:flutter/material.dart';
import 'package:rukunsmart/features/billing/models/billing_model.dart';
import 'bill_card.dart';

class BillList extends StatelessWidget {
  final List<Bill> bills;

  const BillList({super.key, required this.bills});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bills.length,
      itemBuilder: (context, index) {
        return BillCard(bill: bills[index]);
      },
    );
  }
}
