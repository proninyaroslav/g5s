import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceView extends StatelessWidget {
  const BalanceView({super.key, required this.balance});

  final double balance;

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(
      name: 'USD',
      decimalDigits: 2,
    );
    final style = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.primaryFixedDim,
    );

    return DefaultTextStyle(
      style: style,
      child: Row(
        spacing: 18.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'US',
            style: style.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.primaryFixedDim.withValues(alpha: 0.5),
            ),
          ),
          Flexible(child: Text(formatCurrency.format(balance))),
        ],
      ),
    );
  }
}
