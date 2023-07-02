import 'package:flutter/material.dart';

class HomeMarket extends StatelessWidget {
  const HomeMarket({super.key});

  DataColumn col(String text) {
    return DataColumn(
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xff666666),
        ),
      ),
    );
  }

  row() {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text('Sarah')),
        DataCell(Text('19')),
        DataCell(Text('Student')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable(
              showBottomBorder: false,
              columns: [
                '币种',
                '成交均价',
                '24h涨跌',
              ].map(col).toList(),
              rows: [
                row(),
                row(),
                row(),
              ],
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.minPositive, 48),
            ),
            onPressed: () {},
            child: const MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                "查看更多",
                style: TextStyle(),
              ),
            ),
          ),
          const SizedBox(height: 29),
        ],
      ),
    );
  }
}
