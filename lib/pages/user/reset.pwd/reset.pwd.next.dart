part of reset_pwd;

class ResetPwdNext extends StatefulWidget {
  const ResetPwdNext({super.key});

  @override
  State<ResetPwdNext> createState() => _ResetPwdNextState();
}

class _ResetPwdNextState extends State<ResetPwdNext> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormFieldPassword(
            labelText: "新密码",
            controller: _controller,
          ),
          const SizedBox(height: 24),
          UiTextFormField(
            labelText: "确认密码",
            validator: (value) {
              return value == _controller.text ? null : "两次密码不一致";
            },
          ),
        ],
      ),
    );
  }
}
