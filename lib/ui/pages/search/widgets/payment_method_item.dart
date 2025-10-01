import 'package:flutter/material.dart';
import 'package:guest5stars/gen/assets.gen.dart';
import 'package:guest5stars/ui/pages/search/model/payment_method.dart';
import 'package:guest5stars/ui/widgets/divider_card.dart';
import 'package:svg_flutter/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  final PaymentMethod method;
  final bool selected;

  const PaymentMethodItem({
    super.key,
    required this.method,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DividerCard(
        color: selected
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surfaceContainer,
        child: RadioListTile(
          value: method,
          contentPadding: EdgeInsets.symmetric(horizontal: 21.0),
          title: Align(
            alignment: Alignment.centerLeft,
            child: switch (method) {
              PaymentMethod.visa => Image.asset(Assets.images.visa.path),
              PaymentMethod.mastercard => Image.asset(
                Assets.images.mastercard.path,
              ),
              PaymentMethod.paypal => SvgPicture.asset(
                Assets.images.sbp,
                width: 100.0,
              ),
            },
          ),
          dense: true,
        ),
      ),
    );
  }
}
