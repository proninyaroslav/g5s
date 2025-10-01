import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guest5stars/icons/app_icons.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final BoxBorder? border;
  final double size;
  final Duration animationDuration;
  final EdgeInsetsGeometry padding;
  final bool enabled;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.border,
    this.size = 20.0,
    this.animationDuration = const Duration(milliseconds: 180),
    this.padding = const EdgeInsets.all(2.0),
    this.enabled = true,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      value: widget.value ? 1.0 : 0.0,
    );
    _scaleAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void didUpdateWidget(covariant CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    if (!widget.enabled) return;
    widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content = Stack(
      alignment: Alignment.center,
      children: [
        ScaleTransition(
          scale: _scaleAnim,
          child: AnimatedOpacity(
            opacity: widget.value ? 1.0 : 0.0,
            duration: widget.animationDuration,
            child: SizedBox(
              width: widget.size - widget.padding.horizontal,
              height: widget.size - widget.padding.vertical,
              child: Center(
                child: Icon(
                  AppIcons.accept,
                  size: (widget.size - widget.padding.horizontal) * 0.99,
                  color: theme.colorScheme.primaryFixedDim,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    final box = AnimatedContainer(
      duration: widget.animationDuration,
      width: widget.size,
      height: widget.size,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            widget.border as Border? ??
            Border.all(color: theme.colorScheme.onSurface, width: 1.0),
      ),
      child: content,
    );

    return FocusableActionDetector(
      enabled: widget.enabled,
      mouseCursor: widget.enabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      onShowHoverHighlight: (_) {},
      onShowFocusHighlight: (_) {},
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.space): ActivateIntent(),
        LogicalKeySet(LogicalKeyboardKey.enter): ActivateIntent(),
      },
      actions: {
        ActivateIntent: CallbackAction<Intent>(onInvoke: (intent) => _toggle()),
      },
      child: Semantics(
        checked: widget.value,
        container: true,
        enabled: widget.enabled,
        child: InkWell(onTap: widget.enabled ? _toggle : null, child: box),
      ),
    );
  }
}
