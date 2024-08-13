import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/auth/bloc/auth_bloc.dart';
import 'package:rukunsmart/features/auth/repositories/auth_repository.dart';
import 'package:rukunsmart/features/billing/repositories/billing_repository.dart';
// import 'package:rukunsmart/features/complaint/repositories/complaint_repository.dart';
import 'package:rukunsmart/features/news/repositories/news_repository.dart';
import 'package:rukunsmart/shared/services/shared_preference_service.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferenceService = await SharedPreferenceService.getInstance();
  final authRepository =
      AuthRepository(storageService: sharedPreferenceService);
  final billingRepository = BillingRepository();
  final newsRepository = NewsRepository();
  // final complaintRepository = ComplaintRepository();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (context) => authRepository),
        RepositoryProvider<BillingRepository>(
            create: (context) => billingRepository),
        RepositoryProvider<NewsRepository>(create: (context) => newsRepository),
        // RepositoryProvider<ComplaintRepository>(
        //     create: (context) => complaintRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository)..add(CheckAuthStatus()),
          ),
          // Add other BlocProviders here as needed
        ],
        child: const RukunSmartApp(),
      ),
    ),
  );
}
