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
      body: DataGrid(
        columns: [
          DataGridColumn(
            columnName: 'id',
            labelText: "ID",
            key: "",
          ),
          DataGridColumn(
            columnName: 'name',
            labelText: "Name",
            key: "",
          ),
          DataGridColumn(
            columnName: 'designation',
            labelText: "Designation",
            key: "",
          ),
          DataGridColumn(
            columnName: 'salary',
            labelText: "Salary",
            key: "",
            alignment: Alignment.centerRight,
            columnWidthMode: ColumnWidthMode.lastColumnFill,
          ),
        ],
      ),
    );
  }
}
