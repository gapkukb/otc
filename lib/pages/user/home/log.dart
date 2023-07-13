import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/http/http.dart';
import 'package:otc/models/log/log.model.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  List<LogModel> logs = [];
  @override
  void initState() {
    super.initState();

    apis.user.getUserLog(null, HttpOptions(pathParams: {"num": "3"})).then(
      (response) {
        setState(() {
          logs = List.from(response)
              .map((item) => LogModel.fromJson(item))
              .toList(); // this.logs.addAll(logs.map((log) => LogModel.fromJson(log)).toList());
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Panel(
      title: "登录记录",
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          dividerThickness: 0.01,
          headingTextStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          columns: const [
            DataColumn(label: Text("时间")),
            DataColumn(label: Text("登录方式")),
            DataColumn(label: Text("状态")),
            DataColumn(label: Text("IP")),
          ],
          rows: logs.map(
            (log) {
              return DataRow(
                cells: [
                  DataCell(Text(log.createdTime)),
                  DataCell(Text(log.type)),
                  DataCell(
                    Text(
                      log.logged ? "成功" : "失败",
                      style: TextStyle(
                        color: log.logged ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  DataCell(Text(log.ip)),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
