import 'package:flutter/material.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/payments/widgets/paument_stats_item.dart';

class PaymentStats extends StatelessWidget {
  const PaymentStats({
    super.key,
    required this.documents,
    required this.payments,
    required this.rentalHistoryPayments,
  });

  final int documents;
  final int payments;
  final int rentalHistoryPayments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 18.0),
      child: Row(
        spacing: 16.0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PaumentStatsItem(
            label: S.of(context).documentsIntroduced,
            value: documents,
          ),
          PaumentStatsItem(label: S.of(context).paidRequests, value: payments),
          PaumentStatsItem(
            label: S.of(context).paidRentalHistory,
            value: rentalHistoryPayments,
          ),
        ],
      ),
    );
  }
}
