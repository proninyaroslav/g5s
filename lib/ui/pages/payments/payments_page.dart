import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/payments/widgets/balance_view.dart';
import 'package:guest5stars/ui/pages/payments/widgets/payment_stats.dart';
import 'package:guest5stars/ui/widgets/body_container.dart';
import 'package:guest5stars/ui/widgets/custom_app_bar.dart';
import 'package:guest5stars/ui/widgets/filled_button_secondary.dart';

@RoutePage()
class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).payment),
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({super.key});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final _balance = 1500.0;
  final _documents = 465;
  final _payments = 126;
  final _rentalHistoryPayments = 97;

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
      child: Column(
        children: [
          _BalanceCard(
            balance: _balance,
            documents: _documents,
            payments: _payments,
            rentalHistoryPayments: _rentalHistoryPayments,
          ),

          Spacer(),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 10.0,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      // TODO: request payment
                    },
                    label: Text(S.of(context).requestPayment),
                    icon: Icon(AppIcons.account),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: FilledButtonSecondary(
                    onClick: () {
                      // TODO: refresh
                    },
                    label: Text(S.of(context).refreshTheScreen),
                    icon: Icon(AppIcons.refresh),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () {
                      // TODO: history
                    },
                    label: Text(S.of(context).paymentHistory),
                    icon: Icon(AppIcons.download),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
    super.key,
    required this.balance,
    required this.documents,
    required this.payments,
    required this.rentalHistoryPayments,
  });

  final double balance;
  final int documents;
  final int payments;
  final int rentalHistoryPayments;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainer,
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.0,
        children: [
          SizedBox(height: 20.0),

          Text(
            S.of(context).currentBalance,
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          BalanceView(balance: balance),

          Text(
            S.of(context).minimumBalanceSheet50000,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),

          SizedBox.shrink(),

          Divider(),

          PaymentStats(
            documents: documents,
            payments: payments,
            rentalHistoryPayments: rentalHistoryPayments,
          ),
        ],
      ),
    );
  }
}
