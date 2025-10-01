import 'package:flutter/material.dart';

class ConstrainedHeight extends StatelessWidget {
  final BoxConstraints? constraints;
  final Widget child;

  const ConstrainedHeight({super.key, this.constraints, required this.child});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQueryData.fromView(View.of(context));

    return ConstrainedBox(
      constraints:
          constraints ?? BoxConstraints.tightFor(height: mq.size.height),
      child: SizedBox(width: double.infinity, child: child),
    );
  }
}
