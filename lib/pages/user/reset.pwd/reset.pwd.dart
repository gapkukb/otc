library reset_pwd;

import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/text_form_field_email/text_form_field_email.dart';
import 'package:otc/components/text_form_field_password/text_form_field_password.dart';
import 'package:otc/components/text_form_field_phone/text_form_field_phone.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/utils/navigator.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

part 'reset.pwd.email.dart';
part 'reset.pwd.phone.dart';
part 'reset.pwd.next.dart';

class ResetPwd extends StatefulWidget {
  const ResetPwd({super.key});

  @override
  State<ResetPwd> createState() => _ResetPwdState();
}

class _ResetPwdState extends State<ResetPwd> with SingleTickerProviderStateMixin {
  late final TabController _controller;
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isNext = false;

  @override
  void initState() {
    _controller = TabController(length: items.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  static List<CaptchaDevice> items = CaptchaDevice.values.where((element) => element == CaptchaDevice.phone || element == CaptchaDevice.email).toList();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        title: "重置登录密码",
        okButtonText: "下一步",
        onCompelete: (_) async {
          if (isNext) {
          } else {
            await validate();
          }
        },
        children: isNext
            ? [
                const ResetPwdNext(),
              ]
            : [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _controller,
                  tabs: items.map((item) => Tab(text: item.chineseText)).toList(),
                ),
                SizedBox(
                  height: isNext ? 200 : 120,
                  child: TabBarView(
                    controller: _controller,
                    children: items.map((item) {
                      return Center(
                        child: item == CaptchaDevice.phone
                            ? TextFormFieldPhone(
                                controller: _phoneController,
                              )
                            : TextFormFieldEmail(
                                controller: _emailController,
                              ),
                      );
                    }).toList(),
                  ),
                ),
              ],
      ),
    );
  }

  validate() async {
    if (!_formKey.currentState!.validate()) return;

    final result = await openCaptchaWindow(
      CaptchaWindowOptions(
        context: context,
        service: CaptchaSession.addAddressBook,
        account: (_controller.index == 0 ? _phoneController : _emailController).text.trim(),
        preferredDevice: items[_controller.index],
      ),
    );
    if (result != null) {
      setState(() {
        isNext = true;
      });
    }
  }

  reset() {}
}
