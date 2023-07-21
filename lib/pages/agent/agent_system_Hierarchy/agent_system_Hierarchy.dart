import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/pages/async_builder/async_builder.dart';
import 'package:otc/widgets/ui_clipboard.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class AgentHierarchy extends StatefulWidget {
  const AgentHierarchy({super.key});

  @override
  State<AgentHierarchy> createState() => _AgentHierarchyState();
}

class _AgentHierarchyState extends State<AgentHierarchy> {
  final GlobalKey _menuKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: PopupMenuButton(
        //   key: _menuKey,
        //   position: PopupMenuPosition.under,

        //   child: TextButton.icon(
        //     icon: const Icon(Icons.add),
        //     label: const Text("收款方式"),
        //     onPressed: () {
        //       final dynamic state = _menuKey.currentState!;
        //       state.showButtonMenu();
        //     },
        //   ),
        //   color: Colors.amber,
        //   itemBuilder: (context) {
        //     return [
        //       PopupMenuItem(
        //         child: Text("DOTA"),
        //         value: "dota",
        //       ),
        //       PopupMenuItem(
        //         child: Text("英雄联盟"),
        //         value: ["盖伦", "皇子", "提莫"],
        //       ),
        //       PopupMenuItem(
        //         child: Text("王者荣耀"),
        //         value: {"name": "王者荣耀"},
        //       ),
        //     ];
        //   },
        // ),

        title: MenuAnchor(
          menuChildren: [
            MenuItemButton(
              onPressed: () {},
              child: const Text("全部"),
            ),
            MenuItemButton(
              onPressed: () {},
              child: const Text("已使用"),
            ),
            MenuItemButton(
              onPressed: () {},
              child: const Text("未使用"),
            ),
          ],
          builder: (context, controller, child) {
            return TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("收款方式"),
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
            );
          },
        ),
      ),
      body: DataTable2(
        columnSpacing: 4,
        dividerThickness: 0.001,
        empty: UiEmptyView(),
        columns: [
          DataColumn2(label: Text("序号"), fixedWidth: 60),
          DataColumn2(label: Text("邀请码")),
          DataColumn2(label: Text("已成交数量")),
          DataColumn2(label: Text("银行卡比例")),
          DataColumn2(label: Text("支付宝佣金")),
          DataColumn2(label: Text("微信佣金")),
          DataColumn2(label: Text("用户ID")),
        ],
        rows: List.generate(
          40,
          (index) => DataRow(cells: [
            DataCell(Text("1")),
            DataCell(Text("data")),
            DataCell(UiClipboard(
              child: Text("data"),
              text: "啊的方法",
              iconSize: 16,
            )),
            DataCell(Text("data")),
            DataCell(Text("data")),
            DataCell(Text("data")),
            DataCell(Text("data")),
          ]),
        ),
      ),
    );
  }
}
