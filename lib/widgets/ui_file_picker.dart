import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:photo_view/photo_view.dart';

class UiFilePickerController extends ChangeNotifier {}

class UiFilePicker extends StatefulWidget {
  final Function(File? file) onChange;
  final String? title;
  final Widget? titleWidget;
  final double? size;
  const UiFilePicker({
    super.key,
    required this.onChange,
    this.title,
    this.titleWidget,
    this.size,
  });

  @override
  State<UiFilePicker> createState() => _UiFilePickerState();
}

class _UiFilePickerState extends State<UiFilePicker> {
  File? file;

  @override
  void dispose() {
    file = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(widget.title!),
          ),
        DottedBorder(
          dashPattern: const [4],
          strokeWidth: 0.3,
          strokeCap: StrokeCap.round,
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: file == null ? _buildEmpty() : _buildImageView(),
          ),
        )
      ],
    );
  }

  _pick() {
    final picker = ImagePicker();
    if (Platform.isAndroid || Platform.isIOS) {
      Modal.showBottomSheet(
        items: [
          BottomSheetItem(label: "拍照", value: true),
          BottomSheetItem(label: "从相册选择", value: false),
        ],
        onSelected: (value, _) async {
          final ImageSource source =
              value ? ImageSource.camera : ImageSource.gallery;

          final result = await picker.pickImage(
            source: source,
            imageQuality: 80,
            maxWidth: 1080,
            maxHeight: 720,
          );
          if (result != null) {
            setState(() {
              file = File(result.path);
              widget.onChange(file!);
            });
          }
        },
      );
    }
  }

  _delete() async {
    Modal.show(
      content: "您确认删除此图片吗？",
      onOk: () {
        setState(() {
          file = null;
          widget.onChange(null);
        });
      },
    );
  }

  _buildEmpty() {
    return GestureDetector(
      onTap: _pick,
      child: Container(
        color: Colors.transparent,
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.grey,
        ),
      ),
    );
  }

  _buildImageView() {
    return Stack(
      key: ValueKey(file!.path),
      fit: StackFit.expand,
      children: [
        GestureDetector(
          child: Container(
            color: Colors.black38,
            child: Image(
              image: FileImage(file!),
              fit: BoxFit.contain,
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return PhotoView(
                  imageProvider: FileImage(file!),
                  wantKeepAlive: false,
                );
              },
            );
          },
        ),
        Positioned(
          right: -10,
          top: -10,
          child: IconButton(
            icon: const Icon(
              Icons.cancel_rounded,
              color: Colors.white,
            ),
            onPressed: _delete,
          ),
        )
      ],
    );
  }
}
