import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/search/base_payment_page.dart';
import 'package:guest5stars/ui/pages/search/model/payment_method.dart';
import 'package:guest5stars/ui/pages/search/progress_dialog.dart';
import 'package:guest5stars/ui/pages/search/rating_result_dialog.dart';

@RoutePage()
class SearchPaymentPage extends StatelessWidget {
  final double price;

  const SearchPaymentPage({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return BasePaymentPage(
      price: price,
      onSubmit: (paymenyMethod) => _submit(context, paymenyMethod),
    );
  }

  Future<void> _submit(BuildContext context, PaymentMethod method) async {
    // TODO: caculate rating
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          ProgressDialog(title: S.of(context).weCountTheAverageRating),
    );
    await Future.delayed(Duration(seconds: 2));
    if (context.mounted) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => RatingResultDialog(rating: 4),
      );
    }
  }
}
