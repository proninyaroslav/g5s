import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/gen/assets.gen.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/router/app_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

class InputCountryDialog extends StatelessWidget {
  final String number;
  final String date;

  const InputCountryDialog({
    super.key,
    required this.number,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(10.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 15.0,
        children: [
          SizedBox.shrink(),

          SvgPicture.asset(Assets.images.result),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              S.of(context).severalDocumentsWereFoundEnterTheCountryOfIssuance,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                Navigator.pop(context);
                context.replaceRoute(
                  InputCountryRoute(number: number, date: date),
                );
              },
              child: Text(S.of(context).introduce),
            ),
          ),
        ],
      ),
    );
  }
}
