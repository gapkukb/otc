part of security;

class SecurityAuthrization extends StatelessWidget {
  final UserBaseModel user;
  const SecurityAuthrization({super.key, required this.user});

  _item(BuildContext context) {
    return [
      _Item(
        typeId: 0,
        name: "邮箱",
        value: maskEmail(user.email),
        description: "用于登录、提现和修改安全设置",
        action: UiButton.text(
          label: user.emailValid ? "修改" : "绑定",
          onPressed: () async {
            final result = await openCaptchaWindow(
              context: context,
              service: CaptchaServiceType.boundEmail,
            );
            if (result != null) {
              await context.pushNamed(Routes.updatePhone);
            }
          },
        ),
      ),
      _Item(
        typeId: 1,
        name: "手机",
        value: maskPhoneNumber(user.phone),
        description: "用于登录、提现和修改安全设置",
        action: UiButton.text(
          label: user.phoneValid ? "修改" : "绑定",
          onPressed: () async {
            final result = await openCaptchaWindow(
              context: context,
              service: CaptchaServiceType.boundPhone,
            );
            if (result != null) {
              await context.pushNamed(Routes.updatePhone);
            }
          },
        ),
      ),
      _Item(
        typeId: 2,
        name: "谷歌验证器",
        value: "",
        description: "用于登录、提现和修改安全设置",
        action: UiButton.text(
          // label: user.googleSecretValid ? "修改" : "绑定",
          label: "绑定",
          onPressed: () async {
            final result = await openCaptchaWindow(
              context: context,
              preferredDevice: user.phoneValid
                  ? CaptchaDeviceType.phone
                  : CaptchaDeviceType.email,
              service: CaptchaServiceType.addF2A,
              switchable: user.phoneValid && user.emailValid,
            );
            if (result != null) {
              final String code = await apis.user.validateF2A({
                "device": result["device"],
                "captcha": result["code"],
              });
              await context.pushNamed(Routes.f2a, extra: code);
            }
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = _item(context);
    return Panel(
      title: "身份验证",
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return SecurityItem(item: items[index]);
          },
        ),
      ),
    );
  }
}
