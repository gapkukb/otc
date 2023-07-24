library ad_selling;

import 'package:flutter/material.dart';
import 'package:otc/components/table/table.dart';
import 'package:otc/pages/ad/ad_buying/ad_buying.header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './ad_selling.provider.dart';

class AdvertiseBuying extends StatefulWidget {
  const AdvertiseBuying({super.key});

  @override
  State<AdvertiseBuying> createState() => _AdvertiseBuyingState();
}

class _AdvertiseBuyingState extends State<AdvertiseBuying> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdBuyingHeader(),
      body: DataGrid<Employee>(
        fetcher: (pageNo, pageSize) async {
          // await Future.delayed(Duration(seconds: 3));

          return [];
        },
        buildRow: (row) {},
        pageSize: 50,
        columns: [
          DataGridColumn(
            columnName: 'id',
            title: "广告编号\n币种/法币",
            getValue: (row) => row.id,
          ),
          DataGridColumn(
            columnName: 'name',
            title: "类型",
            getValue: (row) => row.name,
          ),
          DataGridColumn(
            columnName: 'designation',
            title: "广告数量\n限额",
            getValue: (row) => row.designation,
          ),
          DataGridColumn(
            columnName: 'salary',
            title: "已成交数量\n（USDT）",
            getValue: (row) => row.salary,
          ),
          DataGridColumn(
            columnName: 'salary',
            title: "汇率",
            getValue: (row) => row.salary,
          ),
          DataGridColumn(
            columnName: 'salary',
            title: "支付方式",
            getValue: (row) => row.salary,
          ),
          DataGridColumn(
            columnName: 'salary',
            title: "状态",
            getValue: (row) => row.salary,
          ),
          DataGridColumn(
            columnName: 'salary',
            title: "更新时间\n创建时间",
            getValue: (row) => row.salary,
          ),
          DataGridColumn(
            columnName: 'salary',
            title: "操作",
            getValue: (row) => row.salary,
          ),
        ],
      ),
    );
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}
