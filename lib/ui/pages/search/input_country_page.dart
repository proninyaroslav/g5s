import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/search/result_found_dialog.dart';
import 'package:guest5stars/ui/pages/search/widgets/search_button.dart';
import 'package:guest5stars/ui/router/app_router.dart';
import 'package:guest5stars/ui/widgets/body_container.dart';
import 'package:guest5stars/ui/widgets/custom_app_bar.dart';
import 'package:guest5stars/ui/widgets/input_details_form.dart';
import 'package:guest5stars/ui/widgets/unfocus.dart';

@RoutePage()
class InputCountryPage extends StatefulWidget {
  final String number;
  final String date;

  const InputCountryPage({super.key, required this.number, required this.date});

  @override
  State<InputCountryPage> createState() => _InputCountryPageState();
}

class _InputCountryPageState extends State<InputCountryPage> {
  late final _numberController = TextEditingController(text: widget.number);
  late final _dateController = TextEditingController(text: widget.date);
  final _countryController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    _dateController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).clarification,
          leading: AutoLeadingButton(),
        ),
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: BodyContainer(
              child: Stack(
                children: [
                  InputDetailsForm(
                    numberController: _numberController,
                    dateController: _dateController,
                    countryController: _countryController,
                  ),

                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: SearchButton(
                      onClick: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ResultFoundDialog(
                              text: S.of(context).resultFoundDescription,
                              price: 1.0,
                              onPayment: () {
                                // TODO: result price
                                context.replaceRoute(
                                  SearchPaymentRoute(price: 1.0),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
