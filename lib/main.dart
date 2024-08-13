import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/auth/bloc/auth_bloc.dart';
import 'package:rukunsmart/features/auth/repositories/auth_repository.dart';
import 'package:rukunsmart/shared/services/shared_preference_service.dart';
import 'app.dart';


void main() async {
  // Ensure that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferenceService
  final sharedPreferenceService = await SharedPreferenceService.getInstance();

  // Create AuthRepository with SharedPreferenceService
  final authRepository = AuthRepository(storageService: sharedPreferenceService);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authRepository)..add(CheckAuthStatus()),
        ),
        // Add other BlocProviders here as needed
      ],
      child: const RukunSmartApp(),
    ),
  );
}