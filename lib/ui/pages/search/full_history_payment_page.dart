import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/search/base_payment_page.dart';
import 'package:guest5stars/ui/pages/search/model/payment_method.dart';
import 'package:guest5stars/ui/pages/search/progress_dialog.dart';
import 'package:guest5stars/ui/router/app_router.dart';

@RoutePage()
class FullHistoryPaymentPage extends StatelessWidget {
  final double price;

  const FullHistoryPaymentPage({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return BasePaymentPage(
      price: price,
      onSubmit: (paymenyMethod) => _submit(context, paymenyMethod),
    );
  }

  Future<void> _submit(BuildContext context, PaymentMethod method) async {
    // TODO: full rental history
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          ProgressDialog(title: S.of(context).weCollectAFullStory),
    );
    await Future.delayed(Duration(seconds: 2));
    if (context.mounted) {
      Navigator.pop(context);
      context.replaceRoute(RentalHistoryRoute());
    }
  }
}
