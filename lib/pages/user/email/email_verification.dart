import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/widgets/ui_text_field.dart';

class UserEmailVerification extends StatefulWidget {
  const UserEmailVerification({super.key});

  @override
  State<UserEmailVerification> createState() => _UserEmailVerificationState();
}

int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

class _UserEmailVerificationState extends State<UserEmailVerification> {
  TextEditingController _controller = TextEditingController();

  final int _length = 6;

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
                const Text(
                  "账户安全",
                  style: TextStyle(
                    color: Color(0xff7C7C7C),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "手机验证",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff0D163A),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  "手机",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff667086),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "请输入发送至188****211的6位验证码,该验证码在30分钟内有效。",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff667086),
                  ),
                ),
                const SizedBox(height: 24),
                UiTextField(
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                  ),
                  controller: _controller,
                  maxLength: _length,
                  decoration: InputDecoration(
                    label: Text("手机验证码"),
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
                  ),
                ),
                TextButton(
                  child: Text("切换邮箱验证"),
                  onPressed: () {},
                ),
                const SizedBox(height: 24),
                Row(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
