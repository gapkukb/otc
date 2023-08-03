library upload;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:photo_view/photo_view.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
part './upload.picker.dart';

class Upload extends StatefulWidget {
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final String? initialValue;
  final String? Function(List<XFile> files)? validator;
  final String? name;
  final Map<String, dynamic>? formStore;
  final int max;
  final double itemSize;
  final Function(XFile file)? onUploaded;
  final Function(XFile file)? onUploading;
  final Function(XFile file)? onError;
  final UploadController controller;
  final List<String>? titles;
  final MediaType? mediaType;

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
    this.mediaType,
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
    return FormField<List<XFile>>(
      // autovalidateMode: AutovalidateMode.always,
      enabled: widget.enabled,
      // initialValue: XFile(widget.initialValue!),
      onSaved: (value) {
        if (widget.name == null || widget.formStore == null) return;
        widget.formStore!.update(widget.name!, (_) => value, ifAbsent: () => value);
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
                (index) => UploadPicker(
                  title: widget.titles?[index],
                  mediaType: widget.mediaType,
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
      validator: (files) {
        return widget.validator?.call(files ?? []);
      },
    );
  }
}

class UploadController extends ChangeNotifier {
  late final List<XFile> items;

  @override
  void dispose() {
    items.clear();
    notifyListeners();
    super.dispose();
  }

  Future<List<String>> upload() async {
    final formData = await () async {
      var futures = items.map((file) async {
        final bytes = await file.readAsBytes();
        return MultipartFile.fromBytes(
          bytes,
          filename: file.name,
        );
      });

      final result = await Future.wait(futures);

      return FormData.fromMap({
        "file": result.toList(),
      });
    }();
    return (await apis.app.uploadImage(formData)).cast<String>();
  }
}
