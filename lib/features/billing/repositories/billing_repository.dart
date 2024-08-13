import 'package:rukunsmart/features/billing/models/billing_model.dart';

class BillingRepository {
  // Simulated API calls
  Future<List<Bill>> getBills() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return [
      Bill(
        id: '1',
        description: 'Monthly Maintenance Fee',
        amount: 100000,
        dueDate: DateTime.now().add(const Duration(days: 7)),
      ),
      Bill(
        id: '2',
        description: 'Security Fee',
        amount: 50000,
        dueDate: DateTime.now().add(const Duration(days: 7)),
      ),
    ];
  }

  Future<void> uploadReceipt(String billId, String receiptPath) async {
    // Simulate receipt upload
    await Future.delayed(const Duration(seconds: 2));
    print('Receipt uploaded for bill $billId: $receiptPath');
  }

  Future<void> approvePayment(String paymentId) async {
    // Simulate payment approval
    await Future.delayed(const Duration(seconds: 1));
    print('Payment $paymentId approved');
  }
}
