import 'dart:math';

import 'package:flutter/material.dart';
import 'package:otc/components/chart/chart.bar.dart';
import 'package:otc/components/chart/chart.config.dart';
import 'package:otc/components/chart/chart.loading.dart';
import 'package:otc/pages/agent/dashboard/dashboard_24_amount.dart';
import 'package:otc/pages/agent/dashboard/dashboard_24_counter.dart';
import 'package:otc/pages/agent/dashboard/dashboard_overview.dart';

class AgentDashboard extends StatefulWidget {
  const AgentDashboard({super.key});

  @override
  State<AgentDashboard> createState() => _AgentDashboardState();
}

class _AgentDashboardState extends State<AgentDashboard> {
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
