import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/pages/search/input_date_dialog.dart';
import 'package:guest5stars/ui/pages/search/not_found_dialog.dart';
import 'package:guest5stars/ui/pages/search/widgets/search_button.dart';
import 'package:guest5stars/ui/theme.dart';
import 'package:guest5stars/ui/widgets/divider_card.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DividerCard(
          width: double.infinity,
          height: 250.0,
          constraints: BoxConstraints(maxHeight: 250.0, minHeight: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Icon(
                AppIcons.note,
                size: 42.0,
                color: Theme.of(context).colorScheme.primaryFixedDim,
              ),
              Spacer(),
              Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 303),
                  padding: EdgeInsets.only(bottom: 22.0),
                  child: _TextField(controller: _controller),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: SearchButton(onClick: _submit),
        ),
      ],
    );
  }

  void _submit() {
    showDialog(
      context: context,
      builder: (context) {
        // TODO
        if (_controller.text.isEmpty) {
          return NotFoundDialog();
        } else {
          return InputDateDialog();
        }
      },
    );
  }
}

class _TextField extends StatefulWidget {
  final TextEditingController controller;

  const _TextField({super.key, required this.controller});

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  bool _showHint = true;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (isFocus) => setState(() {
        _showHint = !isFocus;
      }),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: _showHint ? S.of(context).enterTheDocumentNumber : null,
          contentPadding: EdgeInsets.zero,
        ),
        style: AppTextTheme.input,
      ),
    );
  }
}
