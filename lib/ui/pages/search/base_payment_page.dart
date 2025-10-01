import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/search/model/payment_method.dart';
import 'package:guest5stars/ui/pages/search/widgets/payment_method_item.dart';
import 'package:guest5stars/ui/widgets/body_container.dart';
import 'package:guest5stars/ui/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class BasePaymentPage extends StatefulWidget {
  final double price;
  final ValueChanged<PaymentMethod> onSubmit;

  const BasePaymentPage({
    super.key,
    required this.price,
    required this.onSubmit,
  });

  @override
  State<BasePaymentPage> createState() => _BasePaymentPageState();
}

class _BasePaymentPageState extends State<BasePaymentPage> {
  PaymentMethod _selected = PaymentMethod.visa;

  @override
  void didUpdateWidget(covariant BasePaymentPage oldWidget) {
    if (oldWidget.price != widget.price) {
      setState(() {
        _selected = PaymentMethod.visa;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).payment,
        leading: AutoLeadingButton(),
      ),
      body: SizedBox(
        height: double.infinity,
        child: SafeArea(
          child: BodyContainer(
            child: Column(
              children: [
                Expanded(
                  child: PaymentsList(
                    selected: _selected,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selected = value;
                        });
                      }
                    },
                  ),
                ),

                _Price(value: widget.price),

                SizedBox(height: 10.0),

                _Submit(onClick: () => widget.onSubmit(_selected)),

                SizedBox(height: 20.0),

                _PrivacyPolicy(),

                SizedBox(height: 4.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Submit extends StatelessWidget {
  const _Submit({super.key, required this.onClick});

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: FilledButton.icon(
        onPressed: onClick,
        label: Text(S.of(context).pay),
        icon: Icon(AppIcons.money),
      ),
    );
  }
}

class _PrivacyPolicy extends StatelessWidget {
  const _PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        launchUrl(Uri.https('google.com'));
      },
      child: Text(S.of(context).privacyPolicy),
    );
  }
}

class _Price extends StatelessWidget {
  const _Price({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(
      name: 'USD',
      decimalDigits: 2,
    );

    return DefaultTextStyle(
      style: TextStyle(
        fontSize: 18.0,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Row(
        spacing: 8.0,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'US',
            style: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.primaryFixedDim.withValues(alpha: 0.5),
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            formatCurrency.format(value),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primaryFixedDim,
              fontWeight: FontWeight.bold,
            ),
          ),

          Flexible(
            child: Text(
              S.of(context).atTheCentralBankRateInRubles,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentsList extends StatelessWidget {
  final PaymentMethod selected;
  final ValueChanged<PaymentMethod?> onChanged;

  const PaymentsList({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      PaymentMethodItem(
        method: PaymentMethod.visa,
        selected: selected == PaymentMethod.visa,
      ),
      PaymentMethodItem(
        method: PaymentMethod.mastercard,
        selected: selected == PaymentMethod.mastercard,
      ),
      PaymentMethodItem(
        method: PaymentMethod.paypal,
        selected: selected == PaymentMethod.paypal,
      ),
    ];

    return RadioGroup<PaymentMethod>(
      groupValue: selected,
      onChanged: onChanged,
      child: ListView.separated(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) => items[index],
        separatorBuilder: (context, index) => SizedBox(height: 10.0),
        itemCount: items.length,
      ),
    );
  }
}
