import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('法律条款'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  // child: Html(
                  //   data: "<h1>法律条款标题</h1>",
                  // ),

                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
