import 'dart:math';

import 'package:flutter/material.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:sidebarx/sidebarx.dart';
import './page_layout_header.dart';

class PageLayout extends StatefulWidget {
  const PageLayout({super.key});

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  late SidebarXController controller;
  @override
  void initState() {
    controller = SidebarXController(
      selectedIndex: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        // backgroundColor: Colors.white,
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(width: 0.1),
        ),
        toolbarHeight: 72.0,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset('assets/images/logo.png'),
        ),
        leadingWidth: min(232, context.width / 5),
        title: Row(
          children: [
            Text("data"),
            Text("data"),
            Text("data"),
          ],
        ),
        actions: [
          UiButton(
            size: UiButtonSize.mini,
            // variant: UiButtonVariant.text,
            iconData: Icons.credit_card,
            onPressed: () {},
          ),
          UiButton(
            size: UiButtonSize.mini,
            // variant: UiButtonVariant.text,
            iconData: Icons.book,
            onPressed: () {},
          ),
          Badge(
            // alignment: Alignment.center,
            child: UiButton(
              size: UiButtonSize.mini,
              variant: UiButtonVariant.text,
              iconData: Icons.email_outlined,
              onPressed: () {},
            ),
          ),
          CircleAvatar(
            child: Image.asset(
              'assets/images/logo.png',
              cacheWidth: 32,
              cacheHeight: 32,
              fit: BoxFit.cover,
            ),
          ),
          ToggleButtons(
            onPressed: (int index) {},
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            selectedBorderColor: Colors.black,
            selectedColor: Colors.white,
            fillColor: Colors.black,
            // color: Colors.black,
            constraints: const BoxConstraints(
              minHeight: 32.0,
              minWidth: 48.0,
            ),
            isSelected: [false, true],
            children: const [
              Text('CNY'),
              Text('USD'),
            ],
          ),
        ],
      ),
      body: Row(
        children: [
          SidebarX(
            controller: controller,
            headerBuilder: (context, extended) {
              if (!extended) return const SizedBox.shrink();
              return Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(16),
                child: Text(
                  "用户中心",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            },
            extendedTheme: SidebarXTheme(
              width: 360,
              itemPadding: const EdgeInsets.all(16),
              selectedItemPadding: const EdgeInsets.all(16),
              itemTextPadding: const EdgeInsets.only(left: 8),
              selectedItemTextPadding: const EdgeInsets.only(left: 8),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              selectedTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              selectedItemDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(100.0),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(1, 1),
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
            ),
            items: const [
              SidebarXItem(
                label: "总览",
                icon: Icons.access_alarm_rounded,
              ),
              SidebarXItem(
                label: "C2C用户中心",
                icon: Icons.access_alarm_rounded,
              ),
              SidebarXItem(
                label: "返佣",
                icon: Icons.access_alarm_rounded,
              ),
              SidebarXItem(
                label: "任务中心",
                icon: Icons.access_alarm_rounded,
              ),
              SidebarXItem(
                label: "账户安全",
                icon: Icons.access_alarm_rounded,
              ),
              SidebarXItem(
                label: "身份认证",
                icon: Icons.access_alarm_rounded,
              ),
              SidebarXItem(
                label: "做市商认证",
                icon: Icons.access_alarm_rounded,
              ),
              SidebarXItem(
                label: "设置",
                icon: Icons.access_alarm_rounded,
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 100,
                          itemBuilder: (context, index) {
                            return Text("data");
                          },
                        ),
                      ),
                      Text("bottom"),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
