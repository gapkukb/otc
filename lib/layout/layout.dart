// import 'dart:math';

// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:otc/pages/layout/layout_footer.dart';
// import 'package:otc/utils/responsive.dart';
// import 'package:otc/widgets/ui_button.dart';
// import 'package:sidebarx/sidebarx.dart';
// import 'package:hover_menu/hover_menu.dart';

// enum ColorLabel {
//   blue('Blue', Colors.blue),
//   pink('Pink', Colors.pink),
//   green('Green', Colors.green),
//   yellow('Yellow', Colors.yellow),
//   grey('Grey', Colors.grey);

//   const ColorLabel(this.label, this.color);
//   final String label;
//   final Color color;
// }

// class Layout extends StatefulWidget {
//   const Layout({super.key});

//   @override
//   State<Layout> createState() => _LayoutState();
// }

// class _LayoutState extends State<Layout> {
//   late SidebarXController controller;
//   @override
//   void initState() {
//     controller = SidebarXController(
//       selectedIndex: 0,
//       extended: true,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   final TextEditingController colorController = TextEditingController();
//   final TextEditingController iconController = TextEditingController();
//   ColorLabel? selectedColor;

//   @override
//   Widget build(BuildContext context) {
//     final List<DropdownMenuEntry<ColorLabel>> colorEntries =
//         <DropdownMenuEntry<ColorLabel>>[];
//     for (final ColorLabel color in ColorLabel.values) {
//       colorEntries.add(
//         DropdownMenuEntry<ColorLabel>(
//             value: color, label: color.label, enabled: color.label != 'Grey'),
//       );
//     }
//     return Scaffold(
//       appBar: AppBar(
//         forceMaterialTransparency: true,
//         // backgroundColor: Colors.white,
//         shape: const UnderlineInputBorder(
//           borderSide: BorderSide(width: 0.1),
//         ),
//         toolbarHeight: 72.0,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 32.0),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Image.asset('assets/images/logo.png'),
//           ),
//         ),
//         leadingWidth: min(232, context.width / 5),
//         title: Row(
//           children: [
//             SizedBox(
//               height: 60,
//               width: 200,
//               child: HoverMenu(
//                 title: InkWell(
//                   onTap: () {},
//                   child: Text('Menu Title'),
//                 ),
//                 items: [
//                   InkWell(
//                     onTap: () {
//                       print('Item 1 clicked');
//                     },
//                     child: ListTile(title: Text('Item 1')),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       print('Item 2 clicked');
//                     },
//                     child: ListTile(title: Text('Item 2')),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       print('Item 3 clicked');
//                     },
//                     child: ListTile(title: Text('Item 3')),
//                   ),
//                 ],
//               ),
//             ),
//             Text("data"),
//             Text("data"),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.credit_card_outlined),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.description_outlined),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Badge(
//               isLabelVisible: true,
//               child: Icon(Icons.mail_outlined),
//             ),
//             onPressed: () {},
//           ),
//           const SizedBox(width: 6),
//           IconButton(
//             padding: const EdgeInsets.symmetric(
//               vertical: 2,
//               horizontal: 2,
//             ),
//             onPressed: () {},
//             icon: Row(
//               children: [
//                 CircleAvatar(
//                   child: Image.asset(
//                     'assets/images/logo.png',
//                     cacheWidth: 32,
//                     cacheHeight: 32,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 const Text("data"),
//                 const Icon(Icons.keyboard_arrow_down_outlined)
//               ],
//             ),
//           ),
//           const SizedBox(width: 24),
//           ToggleButtons(
//             onPressed: (int index) {},
//             borderRadius: const BorderRadius.all(Radius.circular(8)),
//             selectedBorderColor: Colors.black,
//             selectedColor: Colors.white,
//             fillColor: Colors.black,
//             // color: Colors.black,
//             constraints: const BoxConstraints(
//               minHeight: 32.0,
//               minWidth: 48.0,
//             ),
//             isSelected: [false, true],
//             children: const [
//               Text('CNY'),
//               Text('USD'),
//             ],
//           ),
//           const SizedBox(width: 32),
//         ],
//       ),
//       body: Row(
//         children: [
//           SidebarX(
//             showToggleButton: false,
//             controller: controller,
//             headerBuilder: (context, extended) {
//               if (!extended) return const SizedBox.shrink();
//               return Container(
//                 alignment: Alignment.centerLeft,
//                 padding: const EdgeInsets.all(16),
//                 child: Text(
//                   "用户中心",
//                   style: Theme.of(context).textTheme.labelMedium,
//                 ),
//               );
//             },
//             extendedTheme: SidebarXTheme(
//               width: 360,
//               itemPadding: const EdgeInsets.all(16),
//               selectedItemPadding: const EdgeInsets.all(16),
//               itemTextPadding: const EdgeInsets.only(left: 8),
//               selectedItemTextPadding: const EdgeInsets.only(left: 8),
//               textStyle: const TextStyle(fontWeight: FontWeight.bold),
//               selectedTextStyle: const TextStyle(fontWeight: FontWeight.bold),
//               selectedItemDecoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(100.0),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.shade300,
//                     offset: const Offset(1, 1),
//                     blurRadius: 10,
//                     blurStyle: BlurStyle.normal,
//                   ),
//                 ],
//               ),
//             ),
//             items: const [
//               SidebarXItem(
//                 label: "总览",
//                 icon: Icons.access_alarm_rounded,
//               ),
//               SidebarXItem(
//                 label: "C2C用户中心",
//                 icon: Icons.access_alarm_rounded,
//               ),
//               SidebarXItem(
//                 label: "返佣",
//                 icon: Icons.access_alarm_rounded,
//               ),
//               SidebarXItem(
//                 label: "任务中心",
//                 icon: Icons.access_alarm_rounded,
//               ),
//               SidebarXItem(
//                 label: "账户安全",
//                 icon: Icons.access_alarm_rounded,
//               ),
//               SidebarXItem(
//                 label: "身份认证",
//                 icon: Icons.access_alarm_rounded,
//               ),
//               SidebarXItem(
//                 label: "做市商认证",
//                 icon: Icons.access_alarm_rounded,
//               ),
//               SidebarXItem(
//                 label: "设置",
//                 icon: Icons.access_alarm_rounded,
//               ),
//             ],
//           ),
//           Expanded(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return SingleChildScrollView(
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: ConstrainedBox(
//                         constraints: BoxConstraints(
//                           maxWidth: 1010,
//                           minHeight: constraints.maxHeight,
//                         ),
//                         child: IntrinsicHeight(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Text('header'),
//                               Expanded(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: List.generate(
//                                       100,
//                                       (index) => Text(
//                                           "datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata")),
//                                 ),
//                               ),
//                               LayoutFooter(),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/layout/layout.header.dart';

ShellRouteBuilder layout = (context, state, child) {
  return Scaffold(
    appBar: LayoutHeader(),
    body: Row(
      children: [
        Expanded(child: child),
      ],
    ),
  );
};
