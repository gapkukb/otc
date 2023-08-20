import 'package:flutter/material.dart';
import 'package:otc/layout/layout.footer.dart';
import 'package:otc/pages/home/home_advantage.dart';
import 'package:otc/pages/home/home_carousel.dart';
import 'package:otc/pages/home/home_market.dart';
import 'package:otc/pages/home/home_biz_plan.dart';
import 'package:otc/pages/home/home_marqueer.dart';
import 'package:otc/pages/home/home_services.dart';
import 'package:otc/pages/home/home_test.dart';
import 'package:otc/pages/home/home_top.dart';
import 'package:otc/theme/text_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

const double height = 40;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1242),
            child: const Column(
              children: [
                HomeTop(),
                HomeMarqueer(),
                HomeTest(),
                SizedBox(height: 16),
                HomeCarousel(),
                SizedBox(height: 56),
                // Text(
                //   "市场",
                //   style: Font.x6largeBold,
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: 32),
                // HomeMarket(),
                SizedBox(height: 16),
                HomeBizPlan(),
                SizedBox(height: 185),
                HomeServices(),
                SizedBox(height: 196),
                HomeAdvantage(),
                SizedBox(height: 96),
                LayoutFooter(),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: StraggedExample(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StraggedExample extends StatefulWidget {
  const StraggedExample({Key? key}) : super(key: key);

  @override
  _StraggedExampleState createState() => _StraggedExampleState();
}

class _StraggedExampleState extends State<StraggedExample> {
  final fromAPi = ["a", "e", "f", "a"];

  late final dropitems;
  late String initValue;

  @override
  void initState() {
    super.initState();
    final values = fromAPi.toSet().toList();
    dropitems = List.generate(
      values.length,
      (index) => DropdownMenuItem(
        child: Text("item $index"),
        value: values[index],
      ),
    );

    initValue = values[0];
  }

  GlobalKey _dropdownButtonKey = GlobalKey();

  openDropdown() {
    GestureDetector? detector;
    searchForGestureDetector(BuildContext context) {
      context.visitChildElements((element) {
        if (element.widget is GestureDetector) {
          detector = element.widget as GestureDetector;
        } else {
          searchForGestureDetector(element);
        }
      });
    }

    searchForGestureDetector(_dropdownButtonKey.currentContext!);
    detector!.onTap!();
    detector!.onTapCancel!();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onHover: (value) {
            if (value) openDropdown();
          },
          onTap: () {},
          child: DropdownButton(
            key: _dropdownButtonKey,
            value: initValue,
            items: dropitems,
            onChanged: (value) {
              setState(() {
                initValue = value as String;
              });
            },
          ),
        ),
      ),
    );
  }
}
