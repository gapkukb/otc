import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

localtionPicker(BuildContext context) {
  return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString("assets/jsons/location_picker.json"),
      builder: (context, snapshot) {
        print('++++++++++++++------------------------');
        final provinces = jsonDecode(snapshot.data as String)["provinces"];
        final data = [];
        for (var province in provinces) {
          final inner = {};

          inner.putIfAbsent(
            province["provinceName"],
            () =>
                (province["citys"] as List).map((e) => e['cityName']).toList(),
          );
          data.add(inner);
        }
        inspect(data);
        Picker(
          adapter: PickerDataAdapter<String>(
            pickerData: data,
          ),
          changeToFirst: true,
          textAlign: TextAlign.left,
          columnPadding: const EdgeInsets.all(8.0),
          onConfirm: (Picker picker, List value) {
            print(value.toString());
            print(picker.getSelectedValues());
          },
        ).showBottomSheet(context);
        return SizedBox.shrink();
      });
}
