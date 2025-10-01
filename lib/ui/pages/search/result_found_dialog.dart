import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/widgets/custom_checkbox.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultFoundDialog extends StatefulWidget {
  final String text;
  final double price;
  final VoidCallback onPayment;

  const ResultFoundDialog({
    super.key,
    required this.text,
    required this.price,
    required this.onPayment,
  });

  @override
  State<ResultFoundDialog> createState() => _ResultFoundDialogState();
}

class _ResultFoundDialogState extends State<ResultFoundDialog> {
  bool _agreementChecked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(10.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 15.0,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),

          Row(
            spacing: 16.0,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: _AgreementText()),
              CustomCheckbox(
                value: _agreementChecked,
                onChanged: (value) => setState(() {
                  _agreementChecked = value;
                }),
              ),
            ],
          ),

          SizedBox.shrink(),

          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _agreementChecked
                  ? () {
                      // pop dialog first
                      Navigator.pop(context);
                      widget.onPayment();
                    }
                  : null,
              child: Text(S.of(context).goToPayment),
            ),
          ),

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

class _AgreementText extends StatelessWidget {
  const _AgreementText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall,
        text: S.of(context).iGetAcquaintedAndAgreeWith,
        children: [
          TextSpan(
            text: S.of(context).contractOfOffer,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            mouseCursor: SystemMouseCursors.click,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // TODO: user agreement link
                launchUrl(Uri.https('google.com'));
              },
          ),
        ],
      ),
    );
  }
}
