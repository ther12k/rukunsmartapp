import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/billing/bloc/billing_event.dart';
import 'package:rukunsmart/features/billing/bloc/billing_state.dart';
import 'package:rukunsmart/features/billing/repositories/billing_repository.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  final BillingRepository billingRepository;

  BillingBloc(this.billingRepository) : super(BillingInitial()) {
    on<LoadBills>(_onLoadBills);
    on<UploadReceipt>(_onUploadReceipt);
    on<ApprovePayment>(_onApprovePayment);
  }

  void _onLoadBills(LoadBills event, Emitter<BillingState> emit) async {
    emit(BillingLoading());
    try {
      final bills = await billingRepository.getBills();
      emit(BillingLoaded(bills));
    } catch (e) {
      emit(BillingError(e.toString()));
    }
  }

  void _onUploadReceipt(UploadReceipt event, Emitter<BillingState> emit) async {
    emit(BillingLoading());
    try {
      await billingRepository.uploadReceipt(event.billId, event.receiptPath);
      final bills = await billingRepository.getBills(); // Refresh bills
      emit(BillingLoaded(bills));
    } catch (e) {
      emit(BillingError(e.toString()));
    }
  }

  void _onApprovePayment(
      ApprovePayment event, Emitter<BillingState> emit) async {
    emit(BillingLoading());
    try {
      await billingRepository.approvePayment(event.paymentId);
      final bills = await billingRepository.getBills(); // Refresh bills
      emit(BillingLoaded(bills));
    } catch (e) {
      emit(BillingError(e.toString()));
    }
  }
}
