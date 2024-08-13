import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/emergency/bloc/emergency_event.dart';
import 'package:rukunsmart/features/emergency/bloc/emergency_state.dart';

class EmergencyBloc extends Bloc<EmergencyEvent, EmergencyState> {
  EmergencyBloc() : super(EmergencyInitial()) {
    on<TriggerEmergency>(_onTriggerEmergency);
    on<ResetEmergency>(_onResetEmergency);
  }

  void _onTriggerEmergency(
      TriggerEmergency event, Emitter<EmergencyState> emit) async {
    emit(EmergencyTriggered());
    // TODO: Implement actual emergency service call logic here
    await Future.delayed(const Duration(seconds: 5)); // Simulating a delay
    emit(EmergencyHandled());
  }

  void _onResetEmergency(ResetEmergency event, Emitter<EmergencyState> emit) {
    emit(EmergencyInitial());
  }
}
