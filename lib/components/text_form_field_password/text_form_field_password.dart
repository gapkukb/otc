import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/tip/tip.dart';
import 'package:otc/globals/globals.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class TextFormFieldPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String? name;
  final Map<String, dynamic>? formState;
  const TextFormFieldPassword({
    super.key,
    this.formState,
    this.name,
    this.controller,
  });

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  static const range = "8-30个字符";
  static const uppercase = "至少包含一个大写字母";
  static const lowercase = "至少包含一个小写字母";
  static const digit = "至少包含一个数字";

  FocusNode focusNode = FocusNode();
  OverlayEntry? overlayEntry;
  late Widget box;

  @override
  void initState() {
    box = _buildBox(false, false, false, false);
    focusNode.addListener(_showPop);
    super.initState();
  }

  @override
  dispose() {
    focusNode.removeListener(_showPop);
    overlayEntry = null;
    super.dispose();
  }

  _showPop() {
    if (focusNode.hasFocus) {
      overlayEntry = createPopup();
      Overlay.of(context).insert(overlayEntry!);
    } else {
      overlayEntry?.remove();
      overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return UiTextFormField(
      focusNode: focusNode,
      obscureText: true,
      maxLines: 1,
      labelText: "密码",
      name: "password",
      formState: widget.formState,
      validator: (value) {
        final String val = value ?? "";
        bool step1 = true;
        bool step2 = true;
        bool step3 = true;
        bool step4 = true;

        if (val.length < 8 || val.length > 30) {
          step1 = false;
        }
        if (!val.contains(RegExp(r'[A-Z]'))) {
          step2 = false;
        }
        if (!val.contains(RegExp(r'[a-z]'))) {
          step3 = false;
        }
        if (!val.contains(RegExp(r'[0-9]'))) {
          step4 = false;
        }
        var flag = step1 && step2 && step3 && step4;

        overlayEntry?.remove();
        if (flag) {
          overlayEntry = null;
        } else {
          Future.delayed(const Duration(seconds: 0)).then((value) {
            box = _buildBox(step1, step2, step3, step4);
            overlayEntry = createPopup();
            Overlay.of(context).insert(overlayEntry!);
          });
        }

        return flag ? null : "至少8位字符，必须包含大小写字母和数字";
      },
    );
  }

  OverlayEntry createPopup() {
    var box = context.findRenderObject() as RenderBox;
    var size = box.size;
    var offset = box.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 1.0,
          width: size.width,
          child: Material(
            elevation: 4,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: this.box,
            ),
          ),
        );
      },
    );
  }

  _buildBox(bool step1, bool step2, bool step3, bool step4) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLine(step1, range),
        _buildLine(step2, uppercase),
        _buildLine(step3, lowercase),
        _buildLine(step4, digit),
      ],
    );
  }

  _buildLine(bool correct, String text) {
    return Text.rich(
      TextSpan(
        text: correct ? "√ " : "× ",
        style: TextStyle(
          color: correct ? Colors.green : Colors.red,
          fontSize: 12,
          height: 1.5,
          decoration: TextDecoration.none,
        ),
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
