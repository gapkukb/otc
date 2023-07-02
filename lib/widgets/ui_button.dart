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

enum UiButtonVariant {
  elevated,
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
  final UiButtonShape? shape;
  final Color? color;
  final UiButtonVariant? variant;
  final IconData? iconData;
  final Icon? icon;
  final bool? iconOnRight;

  const UiButton(
      {super.key,
      required this.onPressed,
      this.disabled = false,
      this.label,
      this.child,
      this.size = UiButtonSize.medium,
      this.fullWidth = false,
      this.shape,
      this.color,
      this.variant,
      this.iconData,
      this.icon,
      this.iconOnRight});

  @override
  Widget build(BuildContext context) {
    var themeColor = Theme.of(context).primaryColor;
    return MaterialButton(
      minWidth: fullWidth
          ? double.infinity
          : size == UiButtonSize.mini
              ? 0
              : null,
      onPressed: disabled ? null : onPressed,
      height: _size[size],
      color: getbackgroundColor(themeColor),
      textColor: getColor(themeColor),
      shape: _buildShape(themeColor),
      child: _buildChild(),
    );
  }

  Color? getbackgroundColor(Color themeColor) {
    if (variant == UiButtonVariant.text) {
      return null;
    }
    if (variant == UiButtonVariant.outline) {
      return color;
    }
    return color ?? themeColor;
  }

  Color? getColor(Color themeColor) {
    if (variant == UiButtonVariant.outline || variant == UiButtonVariant.text) {
      return themeColor;
    }
    return color != Colors.white ? Colors.white : null;
  }

  ShapeBorder? _buildShape(Color themeColor) {
    if (variant == UiButtonVariant.outline) {
      if (shape == UiButtonShape.rounded) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
          side: BorderSide(
            color: themeColor,
          ),
        );
      }
      return OutlineInputBorder(
        borderSide: BorderSide(color: themeColor),
      );
    }
    return _shape[shape];
  }

  Widget _buildChild() {
    Icon? $icon = icon ?? (iconData == null ? null : Icon(iconData));
    Widget $child = child ??
        Text(
          label ?? "",
          style: TextStyle(fontSize: _fontSize[size]),
        );

    if ($icon == null) {
      return $child;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: iconOnRight == true ? TextDirection.rtl : null,
      children: [
        $icon,
        const SizedBox(width: 4),
        $child,
      ],
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
    UiButtonShape.rounded: const StadiumBorder(),
    UiButtonShape.circle: const CircleBorder(),
    UiButtonShape.square: const LinearBorder(),
  };
}
