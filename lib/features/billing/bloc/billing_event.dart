abstract class BillingEvent {}

class LoadBills extends BillingEvent {}

class UploadReceipt extends BillingEvent {
  final String billId;
  final String receiptPath;
  UploadReceipt(this.billId, this.receiptPath);
}

class ApprovePayment extends BillingEvent {
  final String paymentId;
  ApprovePayment(this.paymentId);
}