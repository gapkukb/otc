import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:otc/globals/globals.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'package:otc/widgets/ui_text_form_field.dart';
import 'package:phone_numbers_parser/metadata.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class TextFormFieldPhone extends StatefulWidget {
  final TextEditingController? controller;

  const TextFormFieldPhone({
    super.key,
    this.controller,
  });

  @override
  State<TextFormFieldPhone> createState() => _TextFormFieldPhoneState();
}

class _TextFormFieldPhoneState extends State<TextFormFieldPhone> {
  String _countryCode =
      globals.prefs.getString(globals.keys.countryCode) ?? "+86";

  IsoCode get _isoCode {
    return countryCodeToIsoCode[_countryCode.substring(1)]!.first;
  }

  String get example {
    return metadataExamplesByIsoCode[_isoCode]?.mobile ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return UiTextFormField(
      keyboardType: TextInputType.emailAddress,
      labelText: "手机号码",
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey[300]),
        hintText: example,
        prefixIcon: SizedBox(
          child: CountryCodePicker(
            initialSelection: _countryCode,
            favorite: const ['+86', '+63'],
            onChanged: (value) {
              _countryCode = value.dialCode!;
              globals.prefs.setString(globals.keys.countryCode, _countryCode);
              setState(() {});
            },
            builder: (country) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(country!.dialCode!),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              );
            },
            showFlagMain: false,
            searchDecoration: const InputDecoration(
              labelText: "请输入您要筛选的国家或者区号",
            ),
            showDropDownButton: false,
            alignLeft: false,
            dialogSize: context.xs ? null : const Size.fromWidth(500.0),
            emptySearchBuilder: (context) {
              return const UiEmptyView(
                title: "未匹配到您的过滤条件",
                subtitle: "请检查您的输入是否正确或联系客服",
              );
            },
          ),
        ),
      ),
      validator: (value) {
        var ph = PhoneNumber(isoCode: _isoCode, nsn: value!);

        if (value == null || !ph.isValid(type: PhoneNumberType.mobile)) {
          return "请输入正确的手机号码";
        }
        return null;
      },
    );
  }
}
