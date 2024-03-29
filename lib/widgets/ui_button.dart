import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otc/theme/padding.dart';

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
  filled,
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
  final Color? textColor;
  final UiButtonVariant? variant;
  final IconData? iconData;
  final Icon? icon;
  final bool? iconOnRight;
  final EdgeInsets? padding;
  final TextStyle? labelStyle;
  final double? minWidth;
  final double? height;
  final Brightness? colorBrightness;

  const UiButton({
    super.key,
    required this.onPressed,
    this.disabled = false,
    this.size = UiButtonSize.small,
    this.fullWidth = false,
    this.label,
    this.child,
    this.shape,
    this.color,
    this.variant,
    this.iconData,
    this.icon,
    this.iconOnRight,
    this.padding,
    this.labelStyle,
    this.minWidth,
    this.height,
    this.colorBrightness,
    this.textColor,
  });

  get _height {
    if (kIsWeb) {
      return (height ?? _size[size]!) + 8;
    }

    return height ?? _size[size]!;
  }

  @override
  Widget build(BuildContext context) {
    var themeColor = colorBrightness == Brightness.light
        ? Theme.of(context).primaryColorLight
        : colorBrightness == Brightness.dark
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColor;
    return MaterialButton(
      padding: padding ?? _pad[size],
      minWidth: fullWidth ? double.infinity : minWidth ?? (size == UiButtonSize.mini ? 12 : null),
      onPressed: disabled ? null : onPressed,
      height: _height,
      color: getbackgroundColor(themeColor),
      textColor: getColor(themeColor),
      shape: _buildShape(context, themeColor),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white,
      colorBrightness: colorBrightness,
      elevation: 0,
      hoverElevation: 0,
      child: SelectionContainer.disabled(child: _buildChild()),
    );
  }

  Color? getbackgroundColor(Color themeColor) {
    if (disabled) return Colors.grey;
    if (variant == UiButtonVariant.text || variant == UiButtonVariant.outline) {
      return null;
    }
    return color ?? themeColor;
  }

  Color? getColor(Color themeColor) {
    if (disabled) return null;
    if (textColor != null) return textColor;
    if (variant == UiButtonVariant.outline) return themeColor;
    if (variant == UiButtonVariant.text) return themeColor;
    return color != Colors.white ? Colors.white : null;
  }

  ShapeBorder? _buildShape(BuildContext context, Color themeColor) {
    final $color = disabled ? Theme.of(context).disabledColor : (color ?? themeColor);
    if (shape == UiButtonShape.rounded) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99),
        side: BorderSide(
          color: $color,
        ),
      );
    }
    if (variant == UiButtonVariant.text) {
      return null;
    }
    return OutlineInputBorder(
      borderSide: BorderSide(color: $color),
    );
  }

  Widget _buildChild() {
    Icon? $icon = icon ??
        (iconData == null
            ? null
            : Icon(
                iconData,
                size: height == null ? null : height! / 1.5,
              ));
    Widget? $text = child ??
        (label == null
            ? null
            : Text(
                label!,
                style: labelStyle ??
                    TextStyle(
                      fontSize: _fontSize[size],
                    ),
              ));

    if ($icon != null && $text != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: iconOnRight == true ? TextDirection.rtl : null,
        children: [
          $icon,
          const SizedBox(width: 4),
          $text,
        ],
      );
    }
    if ($icon != null) {
      return $icon;
    }
    return $text!;
  }

  static final Map<UiButtonSize, EdgeInsets> _pad = {
    UiButtonSize.mini: Pads.xAxisMini,
    UiButtonSize.small: Pads.xAxisSm,
    UiButtonSize.medium: Pads.xAxisMd,
    UiButtonSize.large: Pads.xAxisLg,
  };
  static final Map<UiButtonSize, double> _size = {
    UiButtonSize.mini: 24.0,
    UiButtonSize.small: 32.0,
    UiButtonSize.medium: 40.0,
    UiButtonSize.large: 48.0,
  };
  static final Map<UiButtonSize, double> _fontSize = {
    UiButtonSize.mini: 12.0,
    UiButtonSize.small: 14.0,
    UiButtonSize.medium: 14.0,
    UiButtonSize.large: 16.0,
  };

  static final Map<UiButtonShape, ShapeBorder> _shape = {
    UiButtonShape.rounded: const StadiumBorder(),
    UiButtonShape.circle: const CircleBorder(),
    UiButtonShape.square: const LinearBorder(),
  };
  const UiButton.text({
    super.key,
    this.disabled = false,
    this.fullWidth = false,
    required this.onPressed,
    this.size = UiButtonSize.medium,
    this.child,
    this.color,
    this.icon,
    this.iconData,
    this.iconOnRight,
    this.label,
    this.labelStyle,
    this.minWidth,
    this.padding,
    this.shape,
    this.height,
    this.variant = UiButtonVariant.text,
    this.colorBrightness,
    this.textColor,
  });
}
