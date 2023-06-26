// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   final bodyGlobalKey = GlobalKey();

//   final List<Widget> myTabs = [
//     Tab(text: 'auto short'),
//     Tab(text: 'auto long'),
//     Tab(text: 'fixed'),
//   ];

//   late TabController _tabController;
//   late ScrollController _scrollController;
//   late bool fixedScroll;

//   Widget _buildCarousel() {
//     return Stack(
//       children: <Widget>[
//         Placeholder(fallbackHeight: 100),
//         Positioned.fill(
//             child: Align(alignment: Alignment.center, child: Text('Slider'))),
//       ],
//     );
//   }

//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//     _tabController = TabController(length: 3, vsync: this);
//     _tabController.addListener(_smoothScrollToTop);
//     print("object");
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   _scrollListener() {
//     if (fixedScroll) {
//       _scrollController.jumpTo(0);
//     }
//   }

//   _smoothScrollToTop() {
//     _scrollController.animateTo(
//       0,
//       duration: Duration(microseconds: 300),
//       curve: Curves.ease,
//     );

//     setState(() {
//       fixedScroll = _tabController.index == 2;
//     });
//   }

//   _buildTabContext(int lineCount) => Container(
//         child: ListView.builder(
//           physics: const ClampingScrollPhysics(),
//           itemCount: lineCount,
//           itemBuilder: (BuildContext context, int index) {
//             return Text('some content');
//           },
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//         controller: _scrollController,
//         headerSliverBuilder: (context, value) {
//           return [
//             SliverToBoxAdapter(child: _buildCarousel()),
//             SliverToBoxAdapter(
//               child: TabBar(
//                 controller: _tabController,
//                 labelColor: Colors.redAccent,
//                 isScrollable: true,
//                 tabs: myTabs,
//               ),
//             ),
//           ];
//         },
//         body: Container(
//           child: TabBarView(
//             controller: _tabController,
//             children: [
//               _buildTabContext(2),
//               _buildTabContext(200),
//               _buildTabContext(2)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ContractWallet extends StatelessWidget {
  const ContractWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            title: const Text('嵌套ListView'),
            // pinned: true, // 固定在顶部
            forceElevated: innerBoxIsScrolled,
          ),
        ];
      },
      body: SliverToBoxAdapter(
        child: Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  TabBar(tabs: [
                    Text("1"),
                    Text("2"),
                  ]),
                  Expanded(
                      child: TabBarView(children: [
                    Text("1111111111111111"),
                    Text("2222222222222"),
                  ]))
                ],
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  FlutterLogo(),
                  TabBar(tabs: [
                    Text("1"),
                    Text("2"),
                  ]),
                  Expanded(
                      child: TabBarView(children: [
                    Text("1111111111111111"),
                    Text("2222222222222"),
                  ]))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
