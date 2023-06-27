import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/components/tip/tip.dart';
import 'package:otc/pages/user/home/fee.dart';
import 'package:otc/pages/user/home/indicator.dart';
import 'package:otc/pages/user/home/log.dart';
import 'package:otc/pages/user/home/overview.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Advertise extends StatefulWidget {
  const Advertise({super.key});

  @override
  State<Advertise> createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownSearch(
                  items: ['全部币种'],
                ),
              ),
              Expanded(
                child: DropdownSearch(
                  items: ['全部币种'],
                ),
              ),
              Expanded(
                child: DropdownSearch(
                  items: ['全部币种'],
                ),
              ),
              Expanded(
                child: DropdownSearch(
                  items: ['全部币种'],
                ),
              ),
              Expanded(
                child: DropdownSearch(
                  items: ['全部币种'],
                ),
              ),
              Spacer(),
              TextButton(
                child: Text("历史广告"),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                child: Text("发布新广告"),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
