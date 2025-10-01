import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';

class AddReviewDialog extends StatefulWidget {
  final ValueChanged<String> onSubmit;

  const AddReviewDialog({super.key, required this.onSubmit});

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20.0,
        children: [
          Icon(
            AppIcons.accept,
            color: Theme.of(context).colorScheme.primary,
            size: 40.0,
          ),

          Text(S.of(context).addReviewDescription, textAlign: TextAlign.center),

          TextField(
            controller: _controller,
            decoration: InputDecoration(border: UnderlineInputBorder()),
          ),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                widget.onSubmit(_controller.text);
              },
              label: Text(S.of(context).save),
              icon: Icon(AppIcons.accept),
            ),
          ),
        ],
      ),
    );
  }
}
