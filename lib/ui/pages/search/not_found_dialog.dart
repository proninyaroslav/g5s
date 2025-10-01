import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/gen/assets.gen.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/router/app_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

class NotFoundDialog extends StatelessWidget {
  const NotFoundDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall;
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.images.emoticonSad),

          SizedBox(height: 6.5),

          Text(
            S.of(context).dataIsNotFound,
            textAlign: TextAlign.center,
            style: textStyle,
          ),

          SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 34.0,
            children: [
              SvgPicture.asset(Assets.images.emoticonHappy),
              Icon(
                AppIcons.money,
                color: Theme.of(context).colorScheme.primaryFixedDim,
                size: 40.0,
              ),
            ],
          ),

          SizedBox(height: 10.5),

          Text(
            S.of(context).makeThemIntoTheBase,
            textAlign: TextAlign.center,
            style: textStyle,
          ),

          SizedBox(height: 9.0),

          Text(
            S.of(context).thanksToCustomersDescription,
            textAlign: TextAlign.center,
            style: textStyle,
          ),

          SizedBox(height: 17.0),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                // pop dialog first
                Navigator.pop(context);
                context.navigateTo(AddRecordRoute());
              },
              label: Text(S.of(context).bring),
              icon: Icon(AppIcons.person),
            ),
          ),

          SizedBox(height: 10.0),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(S.of(context).iAmNotInterestedInMoney),
            ),
          ),
        ],
      ),
    );
  }
}
