import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/widgets/ui_clipboard.dart';
import 'package:otc/widgets/ui_text_field.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserF2a extends StatefulWidget {
  const UserF2a({super.key});

  @override
  State<UserF2a> createState() => _UserF2aState();
}

class _UserF2aState extends State<UserF2a> {
  String _text = "";
  final _controller = TextEditingController();
  final int _length = 6;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 460,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "账户安全",
                      style: TextStyle(
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                  ),
                  subtitle: Text(
                    "谷歌验证",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff0D163A),
                    ),
                  ),
                  trailing: Opacity(
                    opacity: 0.2,
                    child: Icon(
                      Icons.security,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(height: 1),
                const SizedBox(height: 24),
                const Text(
                  "谷歌验证器是一款动态口令工具，工作原理类似短信动态验证。绑定后每30s生成一个动态验证码，验证码可用于提现时进行安全验证。",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff667086),
                  ),
                ),
                const SizedBox(height: 16),
                _buildStep1(),
                const SizedBox(height: 16),
                _buildStep2(),
                const SizedBox(height: 16),
                _buildStep3(),
                const SizedBox(height: 32),
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
          child: Text("提交"),
          onPressed: () {
            if (_controller.text.length != _length) {
              BotToast.showText(text: "请正确填写$_length数字验证码！");
            }
          },
        ),
      ],
    );
  }

  _buildStep3() {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("Step3: 输入谷歌验证器中6位数验证码"),
        const SizedBox(height: 8),
        UiTextField(
          autofocus: true,
          controller: _controller,
          maxLength: 6,
          keyboardType: const TextInputType.numberWithOptions(decimal: false),
          decoration: const InputDecoration(
            label: Text("请输入6位数验证码"),
          ),
        ),
      ],
    );
  }

  _buildStep1() {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("Step1：下载谷歌验证器"),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildStep1Item(
                icon: Icons.apple,
                title: "App Store",
                onTap: () {},
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStep1Item(
                icon: Icons.android,
                title: "Google Play",
                onTap: () {},
              ),
            )
          ],
        ),
      ],
    );
  }

  _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitle("Step2: 在谷歌验证器中添加密钥并备份"),
        const Text(
          "打开谷歌验证器，扫描下方二维码或手动输入下述秘钥添加验证令牌。",
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.grey.shade300,
          ),
          child: Row(
            children: [
              QrImageView(
                data: _text,
                version: QrVersions.auto,
                size: 86,
                padding: const EdgeInsets.all(2),
                backgroundColor: Colors.white,
                gapless: false,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 16),
                        title: Text(
                          _text,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        trailing: UiClipboard(text: _text),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "秘钥可用于找回谷歌验证器，请勿透露给他人并妥善备份保存",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildStep1Item({
    required IconData icon,
    required String title,
    required void Function() onTap,
  }) {
    return ListTile(
      onTap: onTap,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      tileColor: Colors.grey.shade700,
      textColor: Colors.white,
      iconColor: Colors.white,
      leading: Icon(
        icon,
        size: 40,
      ),
      title: const Text("下载自"),
      subtitle: Text(title),
    );
  }

  _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18),
    );
  }
}
