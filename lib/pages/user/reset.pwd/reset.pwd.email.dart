part of reset_pwd;

class ResetPwdByEmail extends StatefulWidget {
  const ResetPwdByEmail({super.key});

  @override
  State<ResetPwdByEmail> createState() => _ResetPwdByEmailState();
}

class _ResetPwdByEmailState extends State<ResetPwdByEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormFieldEmail();
  }
}
