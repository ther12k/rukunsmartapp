import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/emergency/bloc/emergency_bloc.dart';
import 'package:rukunsmart/features/emergency/bloc/emergency_event.dart';
import 'package:rukunsmart/features/emergency/bloc/emergency_state.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmergencyBloc, EmergencyState>(
      builder: (context, state) {
        return GestureDetector(
          onLongPress: () {
            if (state is EmergencyInitial) {
              context.read<EmergencyBloc>().add(TriggerEmergency());
            }
          },
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _getButtonColor(state),
            ),
            child: Center(
              child: Text(
                _getButtonText(state),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getButtonColor(EmergencyState state) {
    if (state is EmergencyTriggered) {
      return Colors.orange;
    } else if (state is EmergencyHandled) {
      return Colors.green;
    }
    return Colors.red;
  }

  String _getButtonText(EmergencyState state) {
    if (state is EmergencyTriggered) {
      return 'EMERGENCY\nTRIGGERED';
    } else if (state is EmergencyHandled) {
      return 'HELP\nON THE WAY';
    }
    return 'HOLD FOR\nEMERGENCY';
  }
}
