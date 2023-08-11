part of security;

class SecurityManagment extends StatelessWidget {
  final UserBaseModel user;
  const SecurityManagment({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final items = [
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
        value: "",
        description: "用于保护账户安全",
        action: SecurityButton(
          context: context,
          label: user.hasPaymentPassword ? "修改" : "开启",
          onTap: () async {
            await context.pushNamed(Routes.updateFundsPwd);
            provider.read(userProvider.notifier).updateUser();
          },
        ),
      ),
    ];

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
