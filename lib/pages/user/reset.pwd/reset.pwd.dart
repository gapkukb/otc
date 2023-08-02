library reset_pwd;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/text_form_field_email/text_form_field_email.dart';
import 'package:otc/components/text_form_field_password/text_form_field_password.dart';
import 'package:otc/components/text_form_field_phone/text_form_field_phone.dart';
import 'package:otc/router/router.dart';
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
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formState = {};
  final controller = TextEditingController();

  bool isNext = false;

  @override
  void initState() {
    _controller = TabController(length: items.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  static List<CaptchaDevice> items = CaptchaDevice.values
      .where(
        (element) => element == CaptchaDevice.phone || element == CaptchaDevice.email,
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        title: "重置登录密码",
        okButtonText: "下一步",
        onCompelete: (context) async {
          if (isNext) {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              await apis.user.forgotPwd(formState);
              context.pop();
              context.push(Routes.login);
              Modal.showText(text: "重置密码成功");
            }
          } else {
            await validate();
          }
        },
        children: isNext
            ? [
                TextFormFieldPassword(
                  labelText: "新密码",
                  name: "newPwd",
                  formState: formState,
                  controller: controller,
                  autofocus: true,
                ),
                const SizedBox(height: 24),
                UiTextFormField(
                  labelText: "确认密码",
                  obscureText: true,
                  validator: (value) {
                    return value == controller.text ? null : "两次密码不一致";
                  },
                ),
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
                                formState: formState,
                                name: "account",
                              )
                            : TextFormFieldEmail(
                                formState: formState,
                                name: "account",
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
    _formKey.currentState!.save();

    final result = await openCaptchaWindow(
      CaptchaWindowOptions(
        account: formState['account'],
        preferredDevice: _controller.index == 0 ? CaptchaDevice.phone : CaptchaDevice.email,
        session: CaptchaSession.forget,
      ),
    );
    if (result != null) {
      setState(() {
        isNext = true;
      });
    }
  }
}
