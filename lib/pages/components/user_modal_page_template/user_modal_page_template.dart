import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserModalPageTemplate extends StatelessWidget {
  final String legend;
  final String title;
  final String nextText;
  final List<Widget> children;
  final void Function() onCompelete;

  const UserModalPageTemplate({
    super.key,
    this.legend = "账户安全",
    required this.title,
    this.nextText = "确定",
    required this.onCompelete,
    required this.children,
  });

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
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      legend,
                      style: const TextStyle(
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xff0D163A),
                      ),
                    ),
                  ),
                  trailing: const Opacity(
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
                ...children,
                const SizedBox(height: 32),
                _buildActions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: const Text("取消"),
          onPressed: () {
            context.pop();
          },
        ),
        TextButton(
          onPressed: onCompelete,
          child: Text(nextText),
        ),
      ],
    );
  }
}
