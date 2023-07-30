import 'package:flutter/material.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/layout/layout.footer.dart';
import 'package:otc/pages/home/home_advantage.dart';
import 'package:otc/pages/home/home_carousel.dart';
import 'package:otc/pages/home/home_market.dart';
import 'package:otc/pages/home/home_biz_plan.dart';
import 'package:otc/pages/home/home_marqueer.dart';
import 'package:otc/pages/home/home_services.dart';
import 'package:otc/pages/home/home_top.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/string.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_clipboard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

const double height = 40;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1242),
            child: Column(
              children: [
                HomeTop(),
                HomeMarqueer(),
                SizedBox(height: 16),
                HomeCarousel(),
                SizedBox(height: 56),
                Text(
                  "市场",
                  style: Font.x6largeBold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                HomeMarket(),
                SizedBox(height: 16),
                HomeBizPlan(),
                SizedBox(height: 185),
                HomeServices(),
                SizedBox(height: 196),
                HomeAdvantage(),
                SizedBox(height: 96),
                LayoutFooter(),
                ModalPageTemplate(
                  legend: "钱包",
                  title: "充值详情",
                  iconData: Icons.credit_card_outlined,
                  showOkButton: false,
                  cancelButtonText: "关闭",
                  onCompelete: (context) {},
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                child: Text("1"),
                                alignment: Alignment.center,
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Text(
                                "提币申请已提交",
                                style: Font.small,
                              ),
                              subtitle: Text(
                                "2023-06-10 16:38",
                                style: Font.miniGrey,
                              ),
                            ),
                            ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                child: Text("1"),
                                alignment: Alignment.center,
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Text(
                                "提币申请已提交",
                                style: Font.small,
                              ),
                              subtitle: Text(
                                "2023-06-10 16:38",
                                style: Font.miniGrey,
                              ),
                            ),
                            ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                child: Text("1"),
                                alignment: Alignment.center,
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Text(
                                "提币申请已提交",
                                style: Font.small,
                              ),
                              subtitle: Text(
                                "2023-06-10 16:38",
                                style: Font.miniGrey,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                child: Text("1"),
                                alignment: Alignment.center,
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Text(
                                "提币申请已提交",
                                style: Font.small,
                              ),
                              subtitle: Text(
                                "",
                                style: Font.miniGrey,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 14,
                          top: 52,
                          child: Material(
                            color: Colors.amber,
                            child: SizedBox(
                              width: 4,
                              height: 24,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 14,
                          top: 116,
                          child: Material(
                            color: Colors.amber,
                            child: SizedBox(
                              width: 4,
                              height: 24,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 14,
                          top: 182,
                          child: Material(
                            color: Colors.amber,
                            child: SizedBox(
                              width: 4,
                              height: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Cell(
                      height: height,
                      titleText: "状态",
                      trailingText: "▪已完成",
                      trailingTextStyle: Font.miniGrey.copyWith(color: Colors.green),
                    ),
                    Cell(
                      height: height,
                      titleText: "时间",
                      trailingText: "2023-06-09 10:50",
                      trailingTextStyle: Font.miniGrey,
                    ),
                    Cell(
                      height: height,
                      titleText: "币种",
                      trailingText: "USDT",
                      trailingTextStyle: Font.miniGrey,
                    ),
                    Cell(
                      height: height,
                      titleText: "充值数量",
                      trailingText: "323,443.23",
                      trailingTextStyle: Font.largeBold,
                    ),
                    Cell(
                      height: height,
                      titleText: "转账网络",
                      trailingText: "ERC20",
                      trailingTextStyle: Font.miniGrey,
                    ),
                    Cell(
                      height: height,
                      titleText: "地址",
                      trailing: UiClipboard(
                        text: "0x34de6aef66432cbdbc1f6d64abbb1bb7eff764cf",
                        iconSize: 16,
                        child: Text(
                          "0x34de6aef66432cbdbc1f6d64abbb1bb7eff764cf11111111122",
                          style: Font.miniGrey,
                        ),
                      ),
                    ),
                    Cell(
                      height: height,
                      titleText: "地址",
                      trailingTextStyle: Font.miniGrey,
                      trailing: UiClipboard(
                        text: "0x34de6aef66432cbdbc1f6d64abbb1bb7eff764cf",
                        iconSize: 16,
                        child: Text(
                          "0xd071d895707651032426fdd2fbef26eab46408a60dacf4c3000916d1b454fe98",
                          style: Font.miniGrey,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    Cell(
                      height: height,
                      titleText: "充币账户",
                      trailingText: "资金钱包",
                      trailingTextStyle: Font.miniGrey,
                    ),
                    Gap.small(),
                    Divider(
                      height: 1,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
