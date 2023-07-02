import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/user/verification/verification.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("重置登录密码"),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1,
            tabs: [
              Tab(
                text: "邮箱",
              ),
              Tab(
                text: "手机",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                TextField(),
                SizedBox(
                  height: 64,
                ),
                FilledButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //     opaque: false,
                    //     pageBuilder: (BuildContext context, _, __) =>
                    //         UserPhoneVerification(),
                    //   ),
                    // );
                    context.push('/bind_f2a');
                  },
                  child: IgnorePointer(
                    child: Text("下一步"),
                  ),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                FilledButton(
                  onPressed: () {},
                  child: Text("下一步"),
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
