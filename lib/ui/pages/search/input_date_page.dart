import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/search/input_country_dialog.dart';
import 'package:guest5stars/ui/pages/search/widgets/search_button.dart';
import 'package:guest5stars/ui/widgets/body_container.dart';
import 'package:guest5stars/ui/widgets/custom_app_bar.dart';
import 'package:guest5stars/ui/widgets/input_details_form.dart';
import 'package:guest5stars/ui/widgets/unfocus.dart';

@RoutePage()
class InputDatePage extends StatefulWidget {
  const InputDatePage({super.key});

  @override
  State<InputDatePage> createState() => _InputDatePageState();
}

class _InputDatePageState extends State<InputDatePage> {
  final _numberController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).dateOfIssue,
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
                  ),

                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: SearchButton(
                      onClick: () {
                        final number = _numberController.text;
                        final date = _dateController.text;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return InputCountryDialog(
                              number: number,
                              date: date,
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
