import 'package:flutter/material.dart';
import 'package:otc/asstes/assets.gen.dart';
import 'package:otc/components/logo/logo.dart';
import 'package:otc/router/router.dart';
import 'package:go_router/go_router.dart';

class LayoutFooter extends StatelessWidget {
  const LayoutFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Divider(
          height: 1,
          thickness: 0.5,
        ),
        our(),
        const SizedBox(width: 16),
        Expanded(
          child: siteMap(),
        ),
      ],
    );
  }

  Widget our() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 334,
        minWidth: 0,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Logo(),
          Text(
            "Maoerduo 是一支总部位于新加坡，经过专业训练的计算机科学家和网络工程师组成的团队。我们致力于让您的交易更快，更安全。我们努力改善您的交易体验，让您尽享自由和安全：避免追踪、洗钱、及隐私泄漏。©2022 mybit.com",
            style: TextStyle(),
          ),
        ],
      ),
    );
  }

  Widget siteMap() {
    final json = [
      {
        "colName": "关于我们",
        "children": [
          {
            "name": "交易条款",
            "path": "/",
            "callback": () {},
          },
          {
            "name": "隐私说明",
            "path": "/",
            "callback": () {},
          },
          {
            "name": "交易条款",
            "path": "/",
            "callback": () {},
          },
        ],
      },
      {
        "colName": "服务",
        "children": [
          {
            "name": "费率",
            "path": "/",
            "callback": () {},
          },
          {
            "name": "认证广告方申请",
            "path": "/",
            "callback": () {},
          },
        ],
      },
      {
        "colName": "帮助",
        "children": [
          {
            "name": "FAQ",
            "path": "/",
            "callback": () {},
          },
          {
            "name": "公告中心",
            "path": "/",
            "callback": () {},
          },
          {
            "name": "在线客服",
            "path": "/",
            "callback": () {},
          },
        ],
      },
    ];

    final dataList = json.map((e) => SiteMapStruct.formJson(e)).toList();

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: dataList
          .map(
            (col) => Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    col.colName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ...col.children.map(
                    (item) {
                      return InkWell(
                        onTap: () {
                          if (item.callback == null) {
                            navigatorKey.currentContext!.go(item.path!);
                          } else {
                            item.callback!(item);
                          }
                        },
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff999999),
                          ),
                        ),
                      );
                    },
                  ).toList()
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class SiteMapStructItem {
  late String name;
  String? path;
  Function? callback;
  SiteMapStructItem(this.name, this.path, this.callback);

  SiteMapStructItem.formJson(Map<dynamic, dynamic> json)
      : name = json['name'] ?? "",
        path = json['path'] ?? "",
        callback = json['callback'] ?? ();
}

class SiteMapStruct {
  late String colName;
  late List<SiteMapStructItem> children;

  SiteMapStruct(this.colName, this.children);

  SiteMapStruct.formJson(Map<dynamic, dynamic> json)
      : colName = json['colName'] ?? "",
        children = List.generate(
          json['children'].length,
          (index) {
            return SiteMapStructItem.formJson(json['children'][index]);
          },
        );
}
