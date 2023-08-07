import 'package:flutter/material.dart';
import 'package:otc/components/chart/chart.loading.dart';
import 'package:otc/pages/merchant/dashboard/dashboard_24_amount.dart';
import 'package:otc/pages/merchant/dashboard/dashboard_24_counter.dart';
import 'package:otc/pages/merchant/dashboard/dashboard_overview.dart';

class AgentDashboard extends StatelessWidget {
  const AgentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        DashboardOverview(),
        Dashboard24Counter(),
        Dashboard24Amount(),
        ChartLoading(),
      ],
    );
  }
}
