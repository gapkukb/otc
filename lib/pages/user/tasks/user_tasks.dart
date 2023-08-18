import 'package:flutter/material.dart';
import 'package:otc/asstes/assets.gen.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class UserTasks extends StatefulWidget {
  const UserTasks({super.key});

  @override
  State<UserTasks> createState() => _UserTasksState();
}

class _UserTasksState extends State<UserTasks> with SingleTickerProviderStateMixin {
  late final TabController controller;
  bool _isEmpty = true;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {
        _isEmpty = controller.index == 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade50,
      shape: LinearBorder.none,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            _buildTaskView(),
          ],
        ),
      ),
    );
  }

  _buildTaskView() {
    return Panel(
      margin: const EdgeInsets.only(top: 8),
      titleWidget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              "任务",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            TabBar(
              controller: controller,
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              labelStyle: const TextStyle(fontSize: 12),
              indicator: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Colors.black,
              ),
              tabs: const [
                Text("进行中"),
                Text("历史任务"),
              ],
            )
          ],
        ),
      ),
      child: _buildTab(),
    );
  }

  Padding _buildTab() {
    const List<_Task> tasks = [
      _Task(amount: 500, deadtime: "2023-05-03 01:24(UTC+8)到期", status: "已过期", title: "可兑换500 USDT 灵活适用基金代金券！", type: "手续费减免"),
      _Task(amount: 50, deadtime: "2023-05-03 01:24(UTC+8)到期", status: "已过期", title: "可兑换您的 500 USDT 储蓄试用基金代金券！", type: "手续费减免"),
      _Task(amount: 100, deadtime: "2023-05-03 01:24(UTC+8)到期", status: "已过期", title: "可兑换您的 100 USDT 合约试用代金券！", type: "手续费减免"),
      _Task(amount: 10, deadtime: "2023-05-03 01:24(UTC+8)到期", status: "已过期", title: "完成账户验证并获得 10 USDT 现金返还！", type: "手续费减免"),
      _Task(amount: 10, deadtime: "2023-05-03 01:24(UTC+8)到期", status: "已过期", title: "完成做市商验证并获得 10 USDT 现金返还！", type: "手续费减免"),
      _Task(amount: 5, deadtime: "2023-05-03 01:24(UTC+8)到期", status: "已过期", title: "完成星级订单获得 5 USDT 现金返还！", type: "手续费减免"),
    ];
    return Padding(
      padding: EdgeInsets.all(
        context.responsive(8, lg: 32),
      ),
      child: _isEmpty
          ? const UiEmptyView(
              title: "当前没有发布活动",
              subtitle: "定期查看任务中心，不错过任何活动！",
            )
          : GridView.builder(
              itemCount: tasks.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                height: 160,
                crossAxisCount: context.responsive(1, md: 2, xl: 3, xxl: 4),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return _buildTaskCard(tasks[index]);
              },
            ),
    );
  }

  ClipRRect _buildTaskCard(_Task item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 92,
            color: Colors.deepPurpleAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    item.amount.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ),
                const Text(
                  "USDT",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  item.type,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue.shade100,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(fontSize: 16, height: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item.deadtime,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  // Spacer(),
                  ElevatedButton(
                    onPressed: null,
                    child: Text(item.status),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.deepPurpleAccent,
        image: DecorationImage(image: Assets.images.image4.provider(), alignment: Alignment.centerRight),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "在任务中心参与活动，赢取丰厚奖励。",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "活动不定期发布，奖励有限，请多加关注。",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _Task {
  final String type;
  final double amount;
  final String title;
  final String deadtime;
  final String status;

  const _Task({
    required this.type,
    required this.amount,
    required this.title,
    required this.deadtime,
    required this.status,
  });
}
