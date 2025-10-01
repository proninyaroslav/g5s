import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/search/result_found_dialog.dart';
import 'package:guest5stars/ui/router/app_router.dart';
import 'package:guest5stars/ui/widgets/rating_bar.dart';

class RatingResultDialog extends StatelessWidget {
  final int rating;

  const RatingResultDialog({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).averageRating,
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          SizedBox(height: 7.0),

          RatingBar(value: rating),

          SizedBox(height: 32.0),

          Text(
            S.of(context).fullHistoryFoundDescription,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          SizedBox(height: 28.0),

          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                // pop dialog first
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => ResultFoundDialog(
                    text: S.of(context).fullHistoryPaymentDescription,
                    price: 2.0,
                    onPayment: () {
                      // TODO: full history price
                      context.replaceRoute(FullHistoryPaymentRoute(price: 2.0));
                    },
                  ),
                );
              },
              child: Text(S.of(context).yes),
            ),
          ),

          SizedBox(height: 10.0),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                // pop dialog first
                Navigator.pop(context);
                context.back();
              },
              icon: Icon(AppIcons.back),
              label: Text(S.of(context).returnToTheSearch),
            ),
          ),
        ],
      ),
    );
  }
}
