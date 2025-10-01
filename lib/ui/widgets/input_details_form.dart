import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/theme.dart';
import 'package:guest5stars/ui/widgets/divider_card.dart';
import 'package:guest5stars/ui/widgets/upper_case_input_formatter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputDetailsForm extends StatelessWidget {
  final TextEditingController numberController;
  final TextEditingController dateController;
  final TextEditingController? countryController;

  const InputDetailsForm({
    super.key,
    required this.numberController,
    required this.dateController,
    this.countryController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividerCard(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: _DocNumber(controller: numberController),
        ),

        if (countryController != null)
          DividerCard(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: _Country(controller: countryController!),
          ),

        DividerCard(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: _Date(controller: dateController),
        ),
      ],
    );
  }
}

class _DocNumber extends StatelessWidget {
  const _DocNumber({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: S.of(context).documentNumber,
        prefixIcon: Icon(AppIcons.note),
      ),
      style: AppTextTheme.input,
      keyboardType: TextInputType.text,
      inputFormatters: [
        UpperCaseInputFormatter(),
        MaskTextInputFormatter(
          mask: '####-###-##',
          filter: {"#": RegExp(r'[A-ZА-Я0-9]')},
          type: MaskAutoCompletionType.lazy,
        ),
      ],
    );
  }
}

class _Date extends StatefulWidget {
  const _Date({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<_Date> createState() => _DateState();
}

class _DateState extends State<_Date> {
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() {
          _hasFocus = value;
        });
      },
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: _hasFocus
              ? S.of(context).dayMonthYearFocused
              : S.of(context).dayMonthYear,
          prefixIcon: Icon(AppIcons.calendar),
        ),
        style: AppTextTheme.input,
        keyboardType: TextInputType.datetime,
        inputFormatters: [
          MaskTextInputFormatter(
            mask: '## | ## | ####',
            filter: {"#": RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy,
          ),
        ],
      ),
    );
  }
}

class _Country extends StatelessWidget {
  const _Country({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: S.of(context).theCountryOfIssuingADocument,
        prefixIcon: Icon(AppIcons.web),
      ),
      style: AppTextTheme.input,
      keyboardType: TextInputType.streetAddress,
      textCapitalization: TextCapitalization.words,
    );
  }
}
