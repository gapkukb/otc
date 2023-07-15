part of security;

class SecurityManagment extends StatelessWidget {
  final UserModel user;
  const SecurityManagment({super.key, required this.user});

  List<_Item> _items(BuildContext context) {
    return [
      _Item(
        typeId: 0,
        name: "登录密码",
        value: "",
        description: "用于保护账户安全",
        action: UiButton.text(
          label: "修改",
          onPressed: () {
            context.pushNamed(Routes.udpatePwd);
          },
        ),
      ),
      _Item(
        typeId: 1,
        name: "资金密码",
        value: "未开启",
        description: "用于保护账户安全",
        action: UiButton.text(
          // label: user.emailValid ? "修改" : "开启",
          label: "开启",
          onPressed: () async {
            final result = await openCaptchaWindow(
              context: context,
              service: CaptchaServiceType.boundEmail,
            );
            context.pushNamed(Routes.updateFundsPwd);
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = _items(context);
    return Panel(
      title: "安全管理",
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return SecurityItem(item: items[index]);
          },
        ),
      ),
    );
  }
}
