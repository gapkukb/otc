import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class UiTextField extends TextField {
  static const _isDecimal = TextInputType.numberWithOptions(decimal: true);
  static final _regexpDecimal = RegExp(r'[0-9]+[,.]{0,1}[0-9]*');
  final String? label;
  const UiTextField(
      {super.key,
      super.controller,
      super.focusNode,
      super.undoController,
      super.decoration,
      super.keyboardType,
      super.textInputAction,
      super.textCapitalization,
      super.style,
      super.strutStyle,
      super.textAlign,
      super.textAlignVertical,
      super.textDirection,
      super.readOnly,
      super.showCursor,
      super.autofocus,
      super.obscuringCharacter,
      super.obscureText,
      super.autocorrect,
      super.smartDashesType,
      super.smartQuotesType,
      super.enableSuggestions,
      super.maxLines,
      super.minLines,
      super.expands,
      super.maxLength,
      super.maxLengthEnforcement,
      super.onChanged,
      super.onEditingComplete,
      super.onSubmitted,
      super.onAppPrivateCommand,
      super.inputFormatters,
      super.enabled,
      super.cursorWidth,
      super.cursorHeight,
      super.cursorRadius,
      super.cursorOpacityAnimates,
      super.cursorColor,
      super.selectionHeightStyle,
      super.selectionWidthStyle,
      super.keyboardAppearance,
      super.scrollPadding,
      super.dragStartBehavior,
      super.enableInteractiveSelection,
      super.selectionControls,
      super.onTap,
      super.onTapOutside,
      super.mouseCursor,
      super.buildCounter,
      super.scrollController,
      super.scrollPhysics,
      super.autofillHints,
      super.contentInsertionConfiguration,
      super.clipBehavior,
      super.restorationId,
      super.scribbleEnabled,
      super.enableIMEPersonalizedLearning,
      super.contextMenuBuilder,
      super.canRequestFocus,
      super.spellCheckConfiguration,
      super.magnifierConfiguration,
      this.label});

  @override
  List<TextInputFormatter>? get inputFormatters {
    List<TextInputFormatter> formatters = [];

    if (keyboardType == _isDecimal) {
      formatters.add(FilteringTextInputFormatter.allow(_regexpDecimal));
    }
    if (keyboardType == TextInputType.number) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    if (super.inputFormatters != null) {
      formatters.addAll(super.inputFormatters!);
    }

    return formatters;
  }

  @override
  State<UiTextField> createState() => _UITextFieldState();
}

class _UITextFieldState extends State<UiTextField> {
  bool _showClearButton = false;
  bool _showVisibility = false;
  bool _focused = false;

  late FocusNode _focus;
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: widget.key,
      controller: _controller,
      focusNode: widget.focusNode ?? _focus,
      undoController: widget.undoController,
      decoration: widget.decoration!.copyWith(
        label: widget.label == null
            ? widget.decoration?.label
            : Text(widget.label!),
        border: const OutlineInputBorder(),
        suffixIcon: _suffixIcon(),
        counterText: widget.decoration?.counterText ?? "",
      ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      autofocus: widget.autofocus,
      obscuringCharacter: widget.obscuringCharacter,
      obscureText: widget.obscureText && !_showVisibility,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      onChanged: onChange,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorOpacityAnimates: widget.cursorOpacityAnimates,
      cursorColor: widget.cursorColor,
      selectionHeightStyle: widget.selectionHeightStyle,
      selectionWidthStyle: widget.selectionWidthStyle,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding,
      dragStartBehavior: widget.dragStartBehavior,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      selectionControls: widget.selectionControls,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      mouseCursor: widget.mouseCursor,
      buildCounter: widget.buildCounter,
      scrollController: widget.scrollController,
      scrollPhysics: widget.scrollPhysics,
      autofillHints: widget.autofillHints,
      contentInsertionConfiguration: widget.contentInsertionConfiguration,
      clipBehavior: widget.clipBehavior,
      restorationId: widget.restorationId,
      scribbleEnabled: widget.scribbleEnabled,
      enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
      contextMenuBuilder: widget.contextMenuBuilder,
      canRequestFocus: widget.canRequestFocus,
      spellCheckConfiguration: widget.spellCheckConfiguration,
      magnifierConfiguration: widget.magnifierConfiguration,
    );
  }

  void toggleClearButton() {
    setState(() {
      _showClearButton = widget.controller?.text.isNotEmpty ?? false;
    });
  }

  @override
  void initState() {
    _showClearButton = false;
    _focus = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();

    _focus.addListener(onFocusChange);

    super.initState();
  }

  _suffixIcon() {
    Widget? clearIcon;
    Widget? visibilityIcon = widget.decoration?.suffix;

    if (_showClearButton && _controller.text.isNotEmpty) {
      clearIcon = IconButton(
        onPressed: () {
          _controller.clear();
          setState(() {});
        },
        icon: const Icon(Icons.clear),
      );
    }

    if (widget.obscureText) {
      visibilityIcon = IgnorePointer(
        child: IconButton(
          onPressed: () {
            setState(() {
              _showVisibility = !_showVisibility;
            });
          },
          icon: Icon(
            _showVisibility
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      );
    }
    List<Widget> children = [];

    if (clearIcon != null) {
      children.add(clearIcon);
    }

    if (visibilityIcon != null) {
      children.add(visibilityIcon);
    }

    if (widget.decoration?.suffixIcon != null) {
      children.add(widget.decoration!.suffixIcon!);
    }

    if (children.isEmpty) {
      return null;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  onChange(String value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
    setState(() {
      _showClearButton = value.isNotEmpty;
    });
  }

  onFocusChange() {
    setState(() {
      _focused = _focus.hasFocus;
    });
  }
}
