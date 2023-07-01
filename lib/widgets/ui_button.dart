import 'package:flutter/material.dart';

enum UiButtonSize {
  mini,
  small,
  medium,
  large,
}

enum UiButtonShape {
  square,
  rounded,
  circle,
}

enum UiButtonType {
  solid,
  outline,
  text,
}

class UiButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool disabled;
  final bool fullWidth;
  final String? label;
  final Widget? child;
  final UiButtonSize size;
  final UiButtonShape shape;
  final Color? color;

  const UiButton({
    super.key,
    required this.onPressed,
    this.disabled = false,
    this.label,
    this.child,
    this.size = UiButtonSize.medium,
    this.fullWidth = false,
    this.shape = UiButtonShape.square,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: fullWidth ? double.infinity : null,
      onPressed: disabled ? null : onPressed,
      height: _size[size],
      color: color ?? Theme.of(context).primaryColor,
      textColor: color != Colors.white ? Colors.white : null,
      shape: _shape[shape],
      child: child ??
          Text(
            label ?? "",
            style: TextStyle(fontSize: _fontSize[size]),
          ),
    );
  }

  static final Map<UiButtonSize, double> _size = {
    UiButtonSize.mini: 24.0,
    UiButtonSize.small: 36.0,
    UiButtonSize.medium: 48.0,
    UiButtonSize.large: 56.0,
  };
  static final Map<UiButtonSize, double> _fontSize = {
    UiButtonSize.mini: 12.0,
    UiButtonSize.small: 14.0,
    UiButtonSize.medium: 16.0,
    UiButtonSize.large: 18.0,
  };

  static final Map<UiButtonShape, ShapeBorder> _shape = {
    UiButtonShape.rounded: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(99),
    )
  };
}
