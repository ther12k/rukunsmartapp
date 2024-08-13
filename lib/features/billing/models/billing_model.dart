enum BillStatus { unpaid, pendingApproval, paid }

class Bill {
  final String id;
  final String description;
  final double amount;
  final DateTime dueDate;
  final BillStatus status;

  Bill({
    required this.id,
    required this.description,
    required this.amount,
    required this.dueDate,
    this.status = BillStatus.unpaid,
  });

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      id: json['id'],
      description: json['description'],
      amount: json['amount'].toDouble(),
      dueDate: DateTime.parse(json['dueDate']),
      status: BillStatus.values
          .firstWhere((e) => e.toString() == 'BillStatus.${json['status']}'),
    );
  }
}
