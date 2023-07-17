import 'package:flutter/material.dart';
import 'package:otc/pages/order/c2c.order/all.c2c.order.dart';
import 'package:otc/pages/order/c2c.order/pending.c2c.order.dart';

class OrderC2c extends StatefulWidget {
  const OrderC2c({super.key});

  @override
  State<OrderC2c> createState() => _OrderC2cState();
}

class _OrderC2cState extends State<OrderC2c> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return const [
              SliverToBoxAdapter(
                child: TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(
                      child: Text(
                        "进行中",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "全部订单",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  height: 1,
                  thickness: 0.5,
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              PendingC2cOrder(),
              AllC2cOrder(),
            ],
          ),
        ),
      ),
    );
  }
}
