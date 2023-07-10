import 'package:flutter/material.dart';
import 'package:otc/pages/order/order_c2c/order_c2c_all.dart';
import 'package:otc/pages/order/order_c2c/order_c2c_pending.dart';

class OrderC2c extends StatefulWidget {
  const OrderC2c({super.key});

  @override
  State<OrderC2c> createState() => _OrderC2cState();
}

class _OrderC2cState extends State<OrderC2c> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
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
          body: TabBarView(
            children: [
              OrderC2cPending(),
              OrderC2cAll(),
            ],
          ),
        ),
      ),
    );
  }
}
