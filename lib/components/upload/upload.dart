library upload;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/widgets/ui_file_picker.dart';
import 'dart:io';
part './upload.item.dart';

class Upload<T> extends StatefulWidget {
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final String? initialValue;
  final String? Function(T?)? validator;
  final String? name;
  final Map<String, dynamic>? formStore;
  final int max;
  final double itemSize;
  final Function(T files)? onUploading;
  final Function(T files)? onUploaded;
  final Function(T files)? onError;

  const Upload({
    super.key,
    this.autovalidateMode,
    this.enabled = true,
    this.initialValue,
    this.validator,
    this.name,
    this.formStore,
    this.max = 3,
    this.onError,
    this.onUploaded,
    this.onUploading,
    this.itemSize = 100,
  });

  @override
  State<Upload> createState() => _UploadState<T>();
}

class _UploadState<T> extends State<Upload> {
  final List<StateFile> store = [];

  // bool get isValid {
  //   if (store.length != widget.max) return false;
  //   if(store.firstWhere((element) => element))
  // }

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      enabled: widget.enabled,
      // initialValue: XFile(widget.initialValue!),
      onSaved: (value) {
        if (widget.name == null || widget.formStore == null) return;
        widget.formStore!
            .update(widget.name!, (value) => MultipartFile.fromString(value));
      },
      builder: (field) {
        return InputDecorator(
            decoration: InputDecoration(
              // labelText: 'Subscribe to mailing list.',
              errorText: field.errorText,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            isEmpty: false,
            child: Wrap(
              spacing: 8,
              children: List.generate(
                widget.max,
                (index) => UploadItem(
                  onChange: (file) {},
                ),
              ),
            ));
      },
      validator: (value) {},
    );
  }
}
