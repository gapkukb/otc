import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';

class ModelFcAddress {
  String name;
  String protocol;
  num deadline;
  ModelFcAddress({
    required this.name,
    required this.protocol,
    required this.deadline,
  });

  factory ModelFcAddress.fromJson(Map<String, dynamic> json) {
    return ModelFcAddress(
      name: json["name"],
      protocol: json["protocol"],
      deadline: json["deadline"],
    );
  }
}

class WalletAddressDcAddition extends StatelessWidget {
  static List<Map<String, dynamic>> items = [
    {
      "name": "Ethereum (ERC20)",
      "protocol": "Ethereum (ETH)",
      "deadline": 5,
    },
    {
      "name": "BNB Smart Chain (BEP20)",
      "protocol": "Binance Smart Chain",
      "deadline": 1,
    },
    {
      "name": "Tron (TRC20)",
      "protocol": "Tron (TRX)",
      "deadline": 1,
    },
  ];
  final _formKey = GlobalKey<FormState>();

  WalletAddressDcAddition({super.key});

  List<ModelFcAddress> get _items {
    return items.map(ModelFcAddress.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        legend: "提币地址管理",
        title: "添加钱包地址",
        onCompelete: () {
          if (_formKey.currentState!.validate()) {
            Modal.showText(text: "添加成功");
          }
        },
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text("地址备注"),
            ),
            validator: (value) {
              return value!.isEmpty ? "地址备注不能为空" : "";
            },
          ),
          DropdownSearch(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "币种选择",
              ),
            ),
            items: ["USDT"],
            validator: (value) {
              return value == null ? "请选择币种" : null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("提币地址"),
            ),
          ),
          DropdownSearch<ModelFcAddress>(
            popupProps: PopupProps.dialog(
              fit: FlexFit.loose,
              dialogProps: const DialogProps(
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.all(16),
              ),
              containerBuilder: (context, popupWidget) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "选择网络",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "确保您选择的充币网络与您在提币平台使用的网络一致，否则资产可能会丢失。",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    popupWidget,
                  ],
                );
              },
              itemBuilder: (context, item, isSelected) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: const OutlineInputBorder(),
                    title: Text(item.name),
                    subtitle: Text(item.protocol),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("≈ ${item.deadline} 分钟"),
                        const Text("平均到达时间"),
                      ],
                    ),
                  ),
                );
              },
            ),
            dropdownBuilder: (context, selectedItem) {
              return Text(selectedItem == null ? "" : selectedItem.name);
            },
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "转账网络",
              ),
            ),
            items: _items,
            validator: (value) {
              return value != null ? null : "请选择币种";
            },
          ),
        ],
      ),
    );
  }
}
