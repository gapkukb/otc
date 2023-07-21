import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/pages/ad/ad_buying/ad_buying.header.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AdvertiseBuying extends StatefulWidget {
  const AdvertiseBuying({super.key});

  @override
  State<AdvertiseBuying> createState() => _AdvertiseBuyingState();
}

class _AdvertiseBuyingState extends State<AdvertiseBuying> {
  List<Employee> employees = <Employee>[];

  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployees();
    employeeDataSource = EmployeeDataSource(employees: employees);
  }

  List<Employee> getEmployees() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdvertiseBuyingHeader(),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Column(
            children: [
              SizedBox(
                height: constraint.maxHeight - 60,
                width: constraint.maxWidth,
                child: SfDataGrid(
                  source: employeeDataSource,
                  allowPullToRefresh: true,
                  columns: [
                    GridColumn(
                        columnName: 'id',
                        width: 80,
                        label: Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'ID',
                            ))),
                    GridColumn(
                        columnName: 'name',
                        label: Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.centerLeft,
                            child: Text('Name'))),
                    GridColumn(
                        columnName: 'designation',
                        width: 120,
                        label: Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.centerLeft,
                            child: Text('Designation'))),
                    GridColumn(
                        columnName: 'salary',
                        columnWidthMode: ColumnWidthMode.lastColumnFill,
                        label: Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.centerRight,
                            child: Text('Salary'))),
                  ],
                ),
              ),
              Container(
                  height: 60,
                  child: SfDataPager(
                    delegate: employeeDataSource,
                    pageCount: 13,
                    visibleItemsCount: 13,
                    direction: Axis.horizontal,
                    availableRowsPerPage: [0],
                    itemHeight: 36,
                    itemWidth: 36,
                  ))
            ],
          );
        },
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

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({
    required List<Employee> employees,
  }) {
    _employees = employees
        .map(
          (e) => DataGridRow(
            cells: [
              DataGridCell(columnName: 'id', value: e.id),
              DataGridCell(columnName: 'name', value: e.name),
              DataGridCell(columnName: 'designation', value: e.designation),
              DataGridCell(columnName: 'salary', value: e.salary),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map(
      (cell) {
        return Container(
          alignment: (cell.columnName == 'id' || cell.columnName == 'salary')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: const EdgeInsets.all(16.0),
          child: Text(
            cell.value.toString(),
          ),
        );
      },
    ).toList());
  }

  @override
  Future<void> handleRefresh() async {
    await Future.delayed(Duration(seconds: 5));

    notifyListeners();
  }
}
