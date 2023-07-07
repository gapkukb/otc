import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class UserTasks extends StatefulWidget {
  const UserTasks({super.key});

  @override
  State<UserTasks> createState() => _UserTasksState();
}

class _UserTasksState extends State<UserTasks>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  bool _isEmpty = false;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          _buildTaskView(),
        ],
      ),
    );
  }

  _buildTaskView() {
    return Panel(
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
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
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
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                height: 160,
                crossAxisCount: context.responsive(1, md: 2, xl: 3, xxl: 4),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return _buildTaskCard();
              },
            ),
    );
  }

  ClipRRect _buildTaskCard() {
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
                Text(
                  "500",
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Text(
                  "USDT",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "手续费减免",
                  style: TextStyle(
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
                    "可兑换500 USDT 灵活适用基金代金券！灵活适用基金代金券！灵活适用基金代金券！灵活适用基金代金券！灵活适用基金代金券！灵活适用基金代金券！",
                    style: TextStyle(fontSize: 16, height: 1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "2023-05-03 01:24(UTC+8)到期",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  // Spacer(),
                  ElevatedButton(
                    onPressed: null,
                    child: Text("已过期"),
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
    return Card(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.deepPurpleAccent,
          image: const DecorationImage(
              image: AssetImage("assets/images/06.png"),
              alignment: Alignment.centerRight),
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
      ),
    );
  }
}
