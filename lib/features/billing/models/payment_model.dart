class Payment {
  final String id;
  final String billId;
  final double amount;
  final DateTime date;
  final String receiptUrl;
  final bool isApproved;

  Payment({
    required this.id,
    required this.billId,
    required this.amount,
    required this.date,
    required this.receiptUrl,
    this.isApproved = false,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      billId: json['billId'],
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
      receiptUrl: json['receiptUrl'],
      isApproved: json['isApproved'],
    );
  }
}