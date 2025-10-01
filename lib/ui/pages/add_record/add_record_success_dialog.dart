import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/router/app_router.dart';
import 'package:guest5stars/ui/widgets/filled_button_secondary.dart';

class AddRecordSuccessDialog extends StatelessWidget {
  const AddRecordSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12.0,
        children: [
          Icon(
            AppIcons.accept,
            color: Theme.of(context).colorScheme.primary,
            size: 40.0,
          ),

          Text(
            S.of(context).addRecordSuccessDescriiption,
            textAlign: TextAlign.center,
          ),

          SizedBox.shrink(),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              label: Text(S.of(context).addARecord),
              icon: Icon(AppIcons.accept),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: FilledButtonSecondary(
              onClick: () {
                Navigator.pop(context);
                context.navigateTo(ProfileRoute());
              },
              label: Text(S.of(context).goToPersonalAccount),
              icon: Icon(AppIcons.person),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                Navigator.pop(context);
                context.navigateTo(SearchRoute());
              },
              label: Text(S.of(context).checkTheDocument),
              icon: Icon(AppIcons.exit),
            ),
          ),
        ],
      ),
    );
  }
}
