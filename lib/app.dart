import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/auth/bloc/auth_bloc.dart';
import 'package:rukunsmart/features/auth/screens/login_screen.dart';
import 'package:rukunsmart/features/billing/repositories/billing_repository.dart';
import 'package:rukunsmart/features/home/screens/home_screen.dart';
import 'package:rukunsmart/features/news/repositories/news_repository.dart';

class RukunSmartApp extends StatelessWidget {
  const RukunSmartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RukunSmart',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
