// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';

// class UiDropdownItem<T extends Map<String, dynamic>> {
//   final String name;
//   final dynamic value;
//   final bool? disabled;
//   final T? extra;

//   const UiDropdownItem({
//     required this.name,
//     this.value,
//     this.disabled,
//     this.extra,
//   });

//   factory UiDropdownItem.fromJson(T json) {
//     return UiDropdownItem(
//       name: json["name"],
//       extra: json["protocol"],
//       value: json["value"],
//       disabled: json["disabled"],
//     );
//   }
// }

// class UiDropdown<T extends Map<String, dynamic>> extends StatelessWidget {
//   ///offline items list
//   final List<T> items;

//   ///selected item
//   final T? selectedItem;

//   ///selected items
//   final List<UiDropdownItem<T>> selectedItems;

//   ///function that returns item from API
//   final DropdownSearchOnFind<UiDropdownItem<T>>? asyncItems;

//   ///called when a new item is selected
//   final ValueChanged<UiDropdownItem<T>?>? onChanged;

//   ///called when a new items are selected
//   final ValueChanged<List<T>>? onChangedMultiSelection;

//   ///to customize list of items UI
//   final DropdownSearchBuilder<T>? dropdownBuilder;

//   ///to customize list of items UI in MultiSelection mode
//   final DropdownSearchBuilderMultiSelection<T>? dropdownBuilderMultiSelection;

//   ///customize the fields the be shown
//   final DropdownSearchItemAsString<T>? itemAsString;

//   ///	custom filter function
//   final DropdownSearchFilterFn<T>? filterFn;

//   ///enable/disable dropdownSearch
//   final bool enabled;

//   ///function that compares two object with the same type to detected if it's the selected item or not
//   final DropdownSearchCompareFn<T>? compareFn;

//   /// Used to configure the auto validation of [FormField] and [Form] widgets.
//   final AutovalidateMode? autoValidateMode;

//   /// An optional method to call with the final value when the form is saved via
//   final FormFieldSetter<T>? onSaved;

//   /// An optional method to call with the final value when the form is saved via
//   final FormFieldSetter<List<T>>? onSavedMultiSelection;

//   /// An optional method that validates an input. Returns an error string to
//   /// display if the input is invalid, or null otherwise.
//   final FormFieldValidator<T>? validator;

//   /// An optional method that validates an input. Returns an error string to
//   /// display if the input is invalid, or null otherwise.
//   final FormFieldValidator<List<T>>? validatorMultiSelection;

//   /// callback executed before applying value change
//   final BeforeChange<T>? onBeforeChange;

//   /// callback executed before applying values changes
//   final BeforeChangeMultiSelection<T>? onBeforeChangeMultiSelection;

//   ///define whatever we are in multi selection mode or single selection mode
//   final bool isMultiSelectionMode;

//   ///custom dropdown clear button icon properties
//   final ClearButtonProps clearButtonProps;

//   ///custom dropdown icon button properties
//   final DropdownButtonProps dropdownButtonProps;

//   ///custom props to single mode popup
//   final PopupPropsMultiSelection<T> popupProps;

//   ///dropdown decoration props
//   final DropDownDecoratorProps dropdownDecoratorProps;

//   ///a callBack will be called before opening le popup
//   ///if the callBack return FALSE, the opening of the popup will be cancelled
//   final BeforePopupOpening<T>? onBeforePopupOpening;

//   ///a callBack will be called before opening le popup
//   ///if the callBack return FALSE, the opening of the popup will be cancelled
//   final BeforePopupOpeningMultiSelection<T>? onBeforePopupOpeningMultiSelection;

//   UiDropdown({
//     super.key,
//     required this.items,
//     required this.label,
//     this.errorMessage,
//     this.onSaved,
//     this.validator,
//     this.autoValidateMode = AutovalidateMode.disabled,
//     this.onChanged,
//     this.items = const [],
//     this.selectedItem,
//     this.asyncItems,
//     this.dropdownBuilder,
//     this.dropdownDecoratorProps = const DropDownDecoratorProps(),
//     this.clearButtonProps = const ClearButtonProps(),
//     this.dropdownButtonProps = const DropdownButtonProps(),
//     this.enabled = true,
//     this.filterFn,
//     this.itemAsString,
//     this.compareFn,
//     this.onBeforeChange,
//     this.onBeforePopupOpening,
//     PopupProps<T> popupProps = const PopupProps.menu(),
//   });

//   final String label;
//   final String? errorMessage;

//   List<UiDropdownItem> get _items {
//     return items.map(UiDropdownItem.fromJson).toList();
//   }

//   List<String> get _itemsText {
//     return _items.map((e) => e.name).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownSearch(
//       popupProps: PopupProps.dialog(
//         fit: FlexFit.loose,
//         dialogProps: const DialogProps(
//           backgroundColor: Colors.white,
//           contentPadding: EdgeInsets.all(16),
//         ),
//         containerBuilder: (context, popupWidget) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 label,
//                 style: const TextStyle(fontSize: 18),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 "确保您选择的充币网络与您在提币平台使用的网络一致，否则资产可能会丢失。",
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               popupWidget,
//             ],
//           );
//         },
//         itemBuilder: (context, item, isSelected) {
//           var index = _itemsText.indexWhere((element) => element == item);
//           var current = _items[index];

//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               shape: const OutlineInputBorder(),
//               title: Text(current.name),
//               subtitle: Text(current.name),
//               trailing: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text("≈ ${current.name} 分钟"),
//                   const Text("平均到达时间"),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       dropdownBuilder: (context, selectedItem) {
//         if (selectedItem == null) return const Text("");
//         var index = _itemsText.indexWhere((element) => element == selectedItem);
//         var current = _items[index];

//         return Text(current.name);
//       },
//       dropdownDecoratorProps: DropDownDecoratorProps(
//         dropdownSearchDecoration: InputDecoration(
//           hintText: "",
//           labelText: label,
//         ),
//       ),
//       items: _itemsText,
//       validator: (value) {
//         return value != null ? null : "请选择币种";
//       },
//     );
//   }

//   UiDropdown.multiSelection({
//     Key? key,
//     this.autoValidateMode = AutovalidateMode.disabled,
//     this.items = const [],
//     this.asyncItems,
//     this.dropdownDecoratorProps = const DropDownDecoratorProps(),
//     this.clearButtonProps = const ClearButtonProps(),
//     this.dropdownButtonProps = const DropdownButtonProps(),
//     this.enabled = true,
//     this.filterFn,
//     this.itemAsString,
//     this.compareFn,
//     this.selectedItems = const [],
//     this.popupProps = const PopupPropsMultiSelection.menu(),
//     FormFieldSetter<List<T>>? onSaved,
//     ValueChanged<List<T>>? onChanged,
//     BeforeChangeMultiSelection<T>? onBeforeChange,
//     BeforePopupOpeningMultiSelection<T>? onBeforePopupOpening,
//     FormFieldValidator<List<T>>? validator,
//     DropdownSearchBuilderMultiSelection<T>? dropdownBuilder,
//   }) : super(key: key);
// }
