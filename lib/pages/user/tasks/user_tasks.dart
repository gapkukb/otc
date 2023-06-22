import 'package:flutter/material.dart';
import 'package:otc/pages/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/pages/components/panel/panel.dart';
import 'package:otc/utils/responsive.dart';

class UserTasks extends StatefulWidget {
  const UserTasks({super.key});

  @override
  State<UserTasks> createState() => _UserTasksState();
}

class _UserTasksState extends State<UserTasks> {
  bool _isEmpty = true;

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
      title: "任务",
      child: Padding(
        padding: EdgeInsets.all(
          context.responsive(8, lg: 32),
        ),
        child: _isEmpty
            ? _buildEmpty()
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
      ),
    );
  }

  _buildEmpty() {
    return Container(
      padding: const EdgeInsets.all(40),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/empty.png",
            height: 134,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "当前没有发布活动",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "定期查看任务中心，不错过任何活动！",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
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
