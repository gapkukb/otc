import 'package:flutter/material.dart';
import 'package:otc/components/tip/tip.dart';
import 'package:otc/globals/globals.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class TextFormFieldPassword extends StatefulWidget {
  final TextEditingController? controller;
  const TextFormFieldPassword({
    super.key,
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
  late OverlayEntry overlayEntry;
  late Widget box;
  String tip = "";

  @override
  void initState() {
    box = _buildBox(false, false, false, false);
    super.initState();
    focusNode.addListener(_showPop);
  }

  @override
  dispose() {
    focusNode.removeListener(_showPop);
    super.dispose();
  }

  _showPop() {
    if (focusNode.hasFocus) {
      overlayEntry = createSelectPopupWindow();
      Overlay.of(context).insert(overlayEntry);
    } else {
      overlayEntry.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return UiTextFormField(
      focusNode: focusNode,
      obscureText: true,
      maxLines: 1,
      labelText: "密码",
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
        box = _buildBox(step1, step2, step3, step4);
        Future.value().then((value) {
          overlayEntry.remove();
          _showPop();
        });
        return step1 && step2 && step3 && step4 ? null : "至少8位字符，必须包含大小写字母和数字";
      },
    );
  }

  OverlayEntry createSelectPopupWindow() {
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
