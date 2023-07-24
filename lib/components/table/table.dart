import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nil/nil.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
export 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

typedef Fetcher<T> = Future<List<T>> Function(
  int pageNo,
  int pageSize,
);

extension CopyWith on GridColumn {
  GridColumncopyWith(GridColumn column) {}
}

class DataGrid<T> extends StatefulWidget {
  final List<DataGridColumn<T>> columns;
  final Fetcher<T> fetcher;
  final Function(T row)? buildRow;
  final int pageSize;
  final Widget Function(DataGridCell<dynamic> cell)? buildCell;
  final Alignment? alignment;

  const DataGrid({
    super.key,
    required this.columns,
    required this.fetcher,
    this.buildRow,
    this.pageSize = 20,
    this.buildCell,
    this.alignment,
  });

  @override
  State<DataGrid> createState() => _DataGridState<T>();
}

class _DataGridState<T> extends State<DataGrid> {
  bool showLoading = false;
  bool isEmtpy = false;
  double pageCount = 1;

  late DataGridDataSource<T> dataGridDataSource;

  @override
  void initState() {
    super.initState();
    dataGridDataSource = DataGridDataSource(
      pageSize: widget.pageSize,
      buildCell: widget.buildCell,
      columns: widget.columns as List<DataGridColumn<T>>,
      alignment: alignment,
      fetcher: (pageNo, pageSize) {
        setState(() {
          showLoading = true;
          isEmtpy = false;
        });
        return widget.fetcher(pageNo, pageSize).then((value) {
          isEmtpy = value.isEmpty;
          return value as List<T>;
        }).whenComplete(
          () => setState(() {
            showLoading = false;
            pageCount = 10.0;
          }),
        );
      },
    );
  }

  Alignment get alignment {
    return widget.alignment ?? Alignment.centerLeft;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SfDataGridTheme(
                    data: SfDataGridThemeData(
                        // gridLineColor: Colors.transparent,
                        ),
                    child: SfDataGrid(
                      columnWidthMode: ColumnWidthMode.fill,
                      gridLinesVisibility: GridLinesVisibility.none,
                      headerGridLinesVisibility: GridLinesVisibility.none,
                      horizontalScrollPhysics: const NeverScrollableScrollPhysics(),
                      source: dataGridDataSource,
                      allowPullToRefresh: false,
                      footer: isEmtpy ? const UiEmptyView() : null,
                      footerHeight: constraints.maxHeight - 160,
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
                                      alignment: widget.alignment ?? column.alignment ?? Alignment.centerLeft,
                                      child: Text(column.title),
                                    )
                                  : column.label,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  if (showLoading)
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
            SfDataPager(
              pageCount: pageCount,
              direction: Axis.horizontal,
              delegate: dataGridDataSource,
              visibleItemsCount: 10,
            )
          ],
        );
      },
    );
  }
}

class DataGridDataSource<T> extends DataGridSource {
  final int pageSize;
  final Fetcher<T> fetcher;
  final Widget Function(DataGridCell<dynamic>)? buildCell;
  final List<DataGridColumn<T>> columns;
  final Alignment alignment;

  int index = 1;
  DataGridDataSource({
    required this.pageSize,
    required this.fetcher,
    required this.columns,
    this.buildCell,
    required this.alignment,
  }) {
    handlePageChange(0, 1);
  }

  List<T> _db = [];

  @override
  List<DataGridRow> get rows {
    final List<DataGridRow> rows = [];

    for (var row in _db) {
      final List<DataGridCell> cells = [];

      for (var column in columns) {
        final cell = DataGridCell(
          columnName: column.columnName,
          value: column.getValue(row),
        );

        cells.add(cell);
      }

      rows.add(DataGridRow(cells: cells));
    }

    return rows;
  }

  Widget _defaultBuildCell(cell) {
    return Align(
      alignment: alignment,
      child: Text(cell.value.toString()),
    );
    // return Align(alignment: row.);
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final mapper = buildCell ?? _defaultBuildCell;
    return DataGridRowAdapter(cells: row.getCells().map(mapper).toList());
  }

  @override
  Future<void> handleRefresh() async {
    handlePageChange(index - 1, index);
    notifyListeners();
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    index = newPageIndex;
    _db = await fetcher(newPageIndex, pageSize);
    notifyListeners();
    return true;
  }
}

class DataGridColumn<T> extends GridColumn {
  final Object Function(T row) getValue;
  final Alignment? alignment;
  final String title;
  DataGridColumn({
    required super.columnName,
    super.label = nil,
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
    this.alignment,
    this.title = "",
    required this.getValue,
  });
}
