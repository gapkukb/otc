import 'dart:math';

import 'package:flutter/material.dart';

class AsyncPagesTable extends StatefulWidget {
  const AsyncPagesTable({super.key});

  @override
  State<AsyncPagesTable> createState() => _AsyncPagesTableState();
}

class _AsyncPagesTableState extends State<AsyncPagesTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SizedBox(
        width: double.infinity,
        child: PaginatedDataTable(
          header: const Text('Flight Products'),
          initialFirstRowIndex: 14,
          columns: const [
            DataColumn(label: Text('Avatar')),
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(
                label: Row(children: [
              Text('Price'),
              SizedBox(width: 5.0),
              Icon(Icons.airplanemode_active)
            ])),
            DataColumn(label: Text('No.')),
            DataColumn(label: Text('Address1111111111111111111'))
          ],
          source: DataSource(),
        ),
      ),
    );
  }
}

class DataSource extends DataTableSource {
  final List<Map<String, dynamic>> _sourceData = List.generate(
    100,
    (index) => {
      "avatar": (index % 3 == 1)
          ? 'images/icon_hzw01.jpg'
          : (index % 3 == 2)
              ? 'images/icon_hzw03.jpg'
              : 'images/icon_music.png',
      "id": (index + 1),
      "name": "Item Name ${(index + 1)}",
      "price": Random().nextInt(10000),
      "no.": Random().nextInt(10000),
      "address": (index % 3 == 1)
          ? 'Beijing'
          : (index % 3 == 2)
              ? 'New York'
              : 'Los Angeles'
    },
  );

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(
          CircleAvatar(
              backgroundImage: AssetImage(_sourceData[index]["avatar"])),
        ),
        DataCell(Text(_sourceData[index]['id'].toString())),
        DataCell(Text(_sourceData[index]['name'])),
        DataCell(Text('\$ ${_sourceData[index]['price']}')),
        DataCell(Text(_sourceData[index]['no.'].toString())),
        DataCell(Text(_sourceData[index]['address'].toString()))
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _sourceData.length;

  @override
  int get selectedRowCount => 0;
}
