library upload;

import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/http/http.dart';
import 'package:otc/widgets/ui_file_picker.dart';
import 'dart:io';

part './upload.item.dart';

typedef UFiles = List<StateFile>;

class Upload extends StatefulWidget {
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final String? initialValue;
  final String? Function(UFiles? files)? validator;
  final String? name;
  final Map<String, dynamic>? formStore;
  final int max;
  final double itemSize;
  final Function(UFiles files)? onUploading;
  final Function(UFiles files)? onUploaded;
  final Function(UFiles files)? onError;
  final UploadController controller;
  final List<String>? titles;

  const Upload({
    super.key,
    this.autovalidateMode,
    this.enabled = true,
    this.initialValue,
    this.validator,
    this.name,
    this.formStore,
    this.max = 1,
    this.onError,
    this.onUploaded,
    this.onUploading,
    this.itemSize = 100,
    this.titles,
    required this.controller,
  });

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  void initState() {
    widget.controller.items = [];
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<List<StateFile>>(
      // autovalidateMode: AutovalidateMode.always,
      enabled: widget.enabled,
      // initialValue: XFile(widget.initialValue!),
      onSaved: (value) {
        if (widget.name == null || widget.formStore == null) return;
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
                  title: widget.titles?[index],
                  size: widget.itemSize,
                  onChange: (file) {
                    if (file == null) {
                      widget.controller.items.removeAt(index);
                    } else {
                      widget.controller.items.insert(index, file);
                    }
                    field.setValue(widget.controller.items);
                    field.setState(() {
                      field.validate();
                    });
                  },
                ),
              ),
            ));
      },
      validator: widget.validator,
    );
  }
}

class UploadController extends ChangeNotifier {
  late final List<StateFile> items;

  Future<void> upload() async {
    await Future.wait(items
        .where(
          (item) => item.state != UploadingState.done,
        )
        .map(
          (item) => item.upload(),
        ));
  }

  @override
  void dispose() {
    items.clear();
    notifyListeners();
    super.dispose();
  }
}
