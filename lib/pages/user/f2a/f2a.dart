import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/global/global.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/riverpod.dart';
import 'package:otc/widgets/ui_clipboard.dart';
import 'package:otc/widgets/ui_text_form_field.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class F2A extends StatefulWidget {
  final String text;
  const F2A({
    super.key,
    required this.text,
  });

  @override
  State<F2A> createState() => _F2AState();
}

class _F2AState extends State<F2A> {
  final _controller = TextEditingController();
  final int _length = 6;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      title: "${global.user.base.googleSecretValid ? "修改" : "申请"}谷歌验证器",
      onCompelete: (_) async {
        if (_controller.text.length != _length) {
          Modal.showText(text: "请输入$_length数字验证码");
          return;
        }
        await apis.user.bindF2A({"value": _controller.text});
        context.read(userProvider.notifier).updateUser();
        context.pop();
        Modal.showText(text: "谷歌验证器绑定成功");
      },
      children: [
        const Text(
          "谷歌验证器是一款动态口令工具，工作原理类似短信动态验证。绑定后每30s生成一个动态验证码，验证码可用于提现时进行安全验证。",
          style: Font.miniGrey,
        ),
        const SizedBox(height: 16),
        _buildStep1(),
        const SizedBox(height: 16),
        _buildStep2(),
        const SizedBox(height: 16),
        _buildStep3(),
      ],
    );
  }

  _buildStep3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle("Step3: 输入谷歌验证器中6位数验证码"),
        const SizedBox(height: 8),
        UiTextFormField(
          controller: _controller,
          maxLength: _length,
          keyboardType: const TextInputType.numberWithOptions(decimal: false),
          decoration: InputDecoration(
            label: Text("请输入$_length位验证码"),
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
                onTap: () {
                  launchUrl(
                    Uri.parse(
                      "https://apps.apple.com/us/app/google-authenticator/id388497605",
                    ),
                    mode: LaunchMode.inAppWebView,
                  );
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildStep1Item(
                icon: Icons.android,
                title: "Google Play",
                onTap: () {
                  launchUrl(
                    Uri.parse(
                      "https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2",
                    ),
                    mode: LaunchMode.inAppWebView,
                  );
                },
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
        const SizedBox(height: 8),
        const Text(
          "打开谷歌验证器，扫描下方二维码或手动输入下述秘钥添加验证令牌。",
          style: Font.miniGrey,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.grey.shade300,
          ),
          child: Row(
            children: [
              QrImageView(
                data: "otpauth://totp/maoerduo:${global.user!.base.username}?secret=${widget.text}",
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
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 16),
                        title: Text(
                          widget.text,
                          style: Font.medium,
                        ),
                        trailing: UiClipboard(text: widget.text),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "秘钥可用于找回谷歌验证器，请勿透露给他人并妥善备份保存",
                        style: Font.miniGrey,
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
      tileColor: const Color(0xff67748E),
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
      style: Font.mediumBold,
    );
  }
}
