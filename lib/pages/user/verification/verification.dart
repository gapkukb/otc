import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/widgets/ui_text_field.dart';

class UserVerification extends StatefulWidget {
  final bool isPhoneEditing;
  const UserVerification({
    super.key,
    this.isPhoneEditing = true,
  });

  @override
  State<UserVerification> createState() => _UserVerificationState();
}

int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

class _UserVerificationState extends State<UserVerification> {
  final TextEditingController _controller = TextEditingController();
  final int _length = 6;
  late final String typeText;

  static _getType(bool flag) {
    return flag ? '手机' : '邮箱';
  }

  @override
  void initState() {
    typeText = _getType(widget.isPhoneEditing);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "账户安全",
                      style: TextStyle(
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    "$typeText验证",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff0D163A),
                    ),
                  ),
                  trailing: const Opacity(
                    opacity: 0.2,
                    child: Icon(
                      Icons.mark_email_unread,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(height: 1),
                const SizedBox(height: 24),
                Text(
                  typeText,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff667086),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "请输入您在${typeText}u****n@gmail.com收到的6位验证码，验证码30分钟有效",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff667086),
                  ),
                ),
                const SizedBox(height: 24),
                widget.isPhoneEditing
                    ? _buildPhoneTextField()
                    : _buildEmailTextField(),
                TextButton(
                  child: Text("切换${_getType(!widget.isPhoneEditing)}验证"),
                  onPressed: () {
                    context.pop();
                    context.push(
                      widget.isPhoneEditing
                          ? '/email_verification'
                          : '/phone_verification',
                    );
                  },
                ),
                const SizedBox(height: 24),
                _buildActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: Text("取消"),
          onPressed: () {
            context.pop();
          },
        ),
        TextButton(
          child: Text("下一步"),
          onPressed: () {
            if (_controller.text.length != _length) {
              BotToast.showText(text: "请正确填写$_length数字验证码！");
            }
          },
        ),
      ],
    );
  }

  _buildPhoneTextField() {
    return UiTextField(
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
      ),
      controller: _controller,
      maxLength: _length,
      decoration: _inputDecoration(),
    );
  }

  _buildEmailTextField() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        controller: _controller,
        decoration: _inputDecoration());
  }

  _inputDecoration() {
    return InputDecoration(
      label: Text("$typeText验证码"),
      border: const OutlineInputBorder(),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {},
          // child: CountdownTimer(
          //   endTime: endTime,
          //   widgetBuilder: (_, time) {
          //     if (time == null) {
          //       return const Text('重新获取');
          //     }
          //     return Text('${time.sec}S');
          //   },
          // ),
        ),
      ),
    );
  }
}
