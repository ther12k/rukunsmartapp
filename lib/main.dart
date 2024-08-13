import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/auth/bloc/auth_bloc.dart';
import 'package:rukunsmart/features/auth/repositories/auth_repository.dart';
import 'package:rukunsmart/features/billing/repositories/billing_repository.dart';
import 'package:rukunsmart/features/complaint/repositories/complaint_repository.dart';
import 'package:rukunsmart/features/emergency/bloc/emergency_bloc.dart';
import 'package:rukunsmart/features/finance/bloc/finance_bloc.dart';
import 'package:rukunsmart/features/finance/repositories/finance_repository.dart';
import 'package:rukunsmart/features/news/repositories/news_repository.dart';
import 'package:rukunsmart/shared/services/shared_preference_service.dart';
import 'package:rukunsmart/features/billing/bloc/billing_bloc.dart';
import 'package:rukunsmart/features/news/bloc/news_bloc.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_bloc.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferenceService = await SharedPreferenceService.getInstance();
  final authRepository =
      AuthRepository(storageService: sharedPreferenceService);
  final billingRepository = BillingRepository();
  final newsRepository = NewsRepository();
  final complaintRepository = ComplaintRepository();
  final financeRepository = FinanceRepository();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (context) => authRepository),
        RepositoryProvider<BillingRepository>(
            create: (context) => billingRepository),
        RepositoryProvider<NewsRepository>(create: (context) => newsRepository),
        RepositoryProvider<ComplaintRepository>(
            create: (context) => complaintRepository),
        RepositoryProvider<FinanceRepository>(
            create: (context) => financeRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository)..add(CheckAuthStatus()),
          ),
          BlocProvider<EmergencyBloc>(
            create: (context) => EmergencyBloc(),
          ),
          BlocProvider<FinanceBloc>(
            create: (context) => FinanceBloc(financeRepository),
          ),
          BlocProvider<BillingBloc>(
            create: (context) => BillingBloc(billingRepository),
          ),
          BlocProvider<NewsBloc>(
            create: (context) => NewsBloc(newsRepository),
          ),
          BlocProvider<ComplaintBloc>(
            create: (context) => ComplaintBloc(complaintRepository),
          ),
        ],
        child: const RukunSmartApp(),
      ),
    ),
  );
}
