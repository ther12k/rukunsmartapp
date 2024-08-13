import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rukunsmart/features/finance/widgets/finance_summary_widget.dart';
import 'package:rukunsmart/features/home/widgets/emergency_button.dart';
import 'package:rukunsmart/shared/widgets/region_card.dart';
import '../../../features/auth/bloc/auth_bloc.dart';
import '../../../features/news/screens/news_screen.dart';
import '../../../features/complaint/screens/complaint_screen.dart';
import '../../../features/finance/screens/finance_screen.dart';
import '../../../features/billing/screens/billing_screen.dart';
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
              const FinanceSummary(),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Submit Complaint',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ComplaintScreen()),
                  );
                },
              ),
              const SizedBox(height: 8),
              CustomButton(
                text: 'Finance Details',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FinanceScreen()),
                  );
                },
              ),
              const SizedBox(height: 8),
              CustomButton(
                text: 'Community News',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewsScreen()),
                  );
                },
              ),
              const SizedBox(height: 8),
              CustomButton(
                text: 'Monthly Bills',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BillingScreen()),
                  );
                },
              ),
              const SizedBox(height: 32),
              const EmergencyButton(),
            ],
          ),
        ),
      ),
    );
  }
}
