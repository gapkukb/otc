import 'package:flutter/material.dart';
import 'package:nil/nil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
export 'package:syncfusion_flutter_datagrid/datagrid.dart';

extension CopyWith on GridColumn {
  GridColumncopyWith(GridColumn column) {}
}

class DataGrid extends StatefulWidget {
  final List<DataGridColumn> columns;

  const DataGrid({
    super.key,
    required this.columns,
  });

  @override
  State<DataGrid> createState() => _DataGridState();
}

class _DataGridState extends State<DataGrid> {
  bool showLoading = true;
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
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              SfDataGrid(
                source: employeeDataSource,
                allowPullToRefresh: true,
                columns: widget.columns
                    .map(
                      (column) => GridColumn(
                        columnName: column.columnName,
                        allowEditing: column.allowEditing,
                        allowFiltering: column.allowFiltering,
                        allowSorting: column.allowSorting,
                        autoFitPadding: column.autoFitPadding,
                        columnWidthMode: column.columnWidthMode,
                        filterIconPadding: column.filterIconPadding,
                        filterIconPosition: column.filterIconPosition,
                        filterPopupMenuOptions: column.filterPopupMenuOptions,
                        maximumWidth: column.maximumWidth,
                        minimumWidth: column.minimumWidth,
                        sortIconPosition: column.sortIconPosition,
                        visible: column.visible,
                        width: column.width,
                        label: column.label is Nil
                            ? Align(
                                alignment: column.alignment,
                                child: Text(column.labelText),
                              )
                            : column.label,
                      ),
                    )
                    .toList(),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  color: Colors.white38,
                  // width: constraint.maxWidth,
                  // height: constraint.maxHeight,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
              DataGridCell(
                columnName: 'id222333',
                value: e.id,
              ),
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
        return Text(cell.value.toString());
      },
    ).toList());
  }

  @override
  Future<void> handleRefresh() async {
    await Future.delayed(Duration(seconds: 5));

    notifyListeners();
  }
}

class DataGridColumn extends GridColumn {
  final String key;
  final Alignment alignment;
  final String labelText;
  DataGridColumn({
    required super.columnName,
    super.label = nil,
    required this.key,
    super.allowEditing,
    super.allowFiltering,
    super.allowSorting,
    super.autoFitPadding,
    super.columnWidthMode,
    super.filterIconPadding,
    super.filterIconPosition,
    super.filterPopupMenuOptions,
    super.maximumWidth,
    super.minimumWidth,
    super.sortIconPosition,
    super.visible,
    super.width,
    this.alignment = Alignment.center,
    this.labelText = "",
  });
}
