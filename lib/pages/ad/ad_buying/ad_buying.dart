import 'package:flutter/material.dart';
import 'package:otc/components/table/table.dart';
import 'package:otc/pages/ad/ad_buying/ad_buying.header.dart';

class AdvertiseBuying extends StatefulWidget {
  const AdvertiseBuying({super.key});

  @override
  State<AdvertiseBuying> createState() => _AdvertiseBuyingState();
}

class _AdvertiseBuyingState extends State<AdvertiseBuying> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdvertiseBuyingHeader(),
      body: DataGrid<Employee>(
        fetcher: (pageNo, pageSize) async {
          // await Future.delayed(Duration(seconds: 3));

          return [
            Employee(10001, 'James', 'Project Lead', 20000),
            Employee(10002, 'Kathryn', 'Manager', 30000),
            Employee(10003, 'Lara', 'Developer', 15000),
            Employee(10004, 'Michael', 'Designer', 15000),
            Employee(10005, 'Martin', 'Developer', 15000),
            Employee(10006, 'Newberry', 'Developer', 15000),
            Employee(10007, 'Balnc', 'Developer', 15000),
            Employee(10008, 'Perry', 'Developer', 15000),
            Employee(10009, 'Gable', 'Developer', 15000),
            Employee(10010, 'Grimes', 'Developer', 15000)
          ];
        },
        buildRow: (row) {},
        columns: [
          DataGridColumn(
            columnName: 'id',
            title: "ID",
            getValue: (row) => row.id,
          ),
          DataGridColumn(
            columnName: 'name',
            title: "Name",
            getValue: (row) => row.name,
          ),
          DataGridColumn(
            columnName: 'designation',
            title: "Designation",
            getValue: (row) => row.designation,
          ),
          DataGridColumn(
            columnName: 'salary',
            title: "Salary",
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
