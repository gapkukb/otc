import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class LegalTerms extends StatefulWidget {
  const LegalTerms({super.key});

  @override
  State<LegalTerms> createState() => _LegalTermsState();
}

class _LegalTermsState extends State<LegalTerms> {
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
