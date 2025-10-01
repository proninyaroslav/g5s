import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/add_record/add_record_success_dialog.dart';
import 'package:guest5stars/ui/pages/add_record/add_review_dialog.dart';
import 'package:guest5stars/ui/widgets/body_container.dart';
import 'package:guest5stars/ui/widgets/constrained_height.dart';
import 'package:guest5stars/ui/widgets/custom_app_bar.dart';
import 'package:guest5stars/ui/widgets/input_details_form.dart';
import 'package:guest5stars/ui/widgets/rating_bar.dart';

@RoutePage()
class AddRecordPage extends StatefulWidget {
  const AddRecordPage({super.key});

  @override
  State<AddRecordPage> createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  late final _numberController = TextEditingController();
  late final _dateController = TextEditingController();
  final _countryController = TextEditingController();

  int _rating = 0;

  @override
  void dispose() {
    _numberController.dispose();
    _dateController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).add),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: BodyContainer(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: ConstrainedHeight(
                        child: Column(
                          children: [
                            InputDetailsForm(
                              numberController: _numberController,
                              dateController: _dateController,
                              countryController: _countryController,
                            ),

                            Spacer(),

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                AppLocalizations.of(context)!.rateDescription,
                                textAlign: TextAlign.center,
                              ),
                            ),

                            RatingBar(
                              value: _rating,
                              starSize: 40.0,
                              onChanged: (value) {
                                setState(() {
                                  _rating = value;
                                });
                              },
                            ),

                            Spacer(flex: 3),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      left: 10.0,
                      right: 10.0,
                      bottom: 16.0,
                      child: FilledButton.icon(
                        onPressed: _submit,
                        label: Text(S.of(context).save),
                        icon: Icon(AppIcons.accept),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    // TODO: save record
    showDialog(
      context: context,
      builder: (context) => AddReviewDialog(
        onSubmit: (value) {
          // TODO: submit review

          Navigator.pop(context);

          showDialog(
            context: context,
            builder: (context) => AddRecordSuccessDialog(),
          );
        },
      ),
    );
  }
}
