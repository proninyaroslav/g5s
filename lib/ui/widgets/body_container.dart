import 'package:flutter/material.dart';
import 'package:guest5stars/ui/widgets/constrained_height.dart';

class BodyContainer extends StatelessWidget {
  final Widget child;
  final BoxConstraints? constraints;

  const BodyContainer({super.key, required this.child, this.constraints});

  @override
  Widget build(BuildContext context) {
    return ConstrainedHeight(
      constraints: constraints,
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );
  }
}
