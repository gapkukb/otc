import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sidebarx/sidebarx.dart';

class LegalTerms extends StatefulWidget {
  const LegalTerms({super.key});

  @override
  State<LegalTerms> createState() => _LegalTermsState();
}

class _LegalTermsState extends State<LegalTerms> {
  late SidebarXController controller;

  @override
  void initState() {
    super.initState();
    controller = SidebarXController(selectedIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('法律条款'),
      ),
      body: Row(
        children: [
          SidebarX(
            controller: controller,
            extendedTheme: SidebarXTheme(width: 300),
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          ),
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
