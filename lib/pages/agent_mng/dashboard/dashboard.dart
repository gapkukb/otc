import 'dart:math';

import 'package:flutter/material.dart';
import 'package:otc/pages/agent_mng/dashboard/dashboard_24_counter.dart';
import 'package:otc/pages/agent_mng/dashboard/dashboard_overview.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DashboardOverview(),
          Dashboard24Counter(
            data: List.generate(24, (index) {
              return {"label": "0$index:00", "value": Random().nextInt(10)};
            }),
          ),
        ],
      ),
    );
  }
}
