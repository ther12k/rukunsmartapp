import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/billing/bloc/billing_bloc.dart';
import 'package:rukunsmart/features/complaint/bloc/complaint_bloc.dart';
import 'package:rukunsmart/features/emergency/bloc/emergency_bloc.dart';
import 'package:rukunsmart/features/finance/bloc/finance_bloc.dart';
import 'package:rukunsmart/features/home/widgets/emergency_button.dart';
import 'package:rukunsmart/features/news/bloc/news_bloc.dart';
import 'package:rukunsmart/shared/widgets/region_card.dart';
import '../../../features/auth/bloc/auth_bloc.dart';
import '../../../features/news/screens/news_screen.dart';
import '../../../features/complaint/screens/complaint_screen.dart';
import '../../../features/billing/screens/billing_screen.dart';
import '../../../features/finance/screens/finance_screen.dart'; // Import FinanceScreen
import '../../../shared/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RukunSmart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogoutRequested());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const RegionCard(),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Submit Complaint',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => ComplaintBloc(), // Provide the required bloc
                        child: const ComplaintScreen(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              // Uncomment and add the Finance Details button
              CustomButton(
                text: 'Finance Details',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => FinanceBloc(), // Provide the required bloc
                        child: const FinanceScreen(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              // CustomButton(
              //   text: 'Community News',
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => BlocProvider(
              //           create: (context) => NewsBloc(), // Provide the required bloc
              //           child: const NewsScreen(),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              const SizedBox(height: 8),
              // CustomButton(
              //   text: 'Monthly Bills',
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => BlocProvider(
              //           create: (context) => BillingBloc(), // Provide the required bloc
              //           child: const BillingScreen(),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              const SizedBox(height: 32),
              // Wrap the EmergencyButton with a BlocProvider for EmergencyBloc
              BlocProvider(
                create: (context) => EmergencyBloc(),
                child: const EmergencyButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
