import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otc/pages/components/modal/modal.dart';
import 'package:photo_view/photo_view.dart';

class UiFilePicker extends StatefulWidget {
  const UiFilePicker({super.key});

  @override
  State<UiFilePicker> createState() => _UiFilePickerState();
}

class _UiFilePickerState extends State<UiFilePicker> {
  ImageProvider? image;

  @override
  void dispose() {
    image = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [5],
      child: Container(
        width: 125,
        height: 125,
        child: image == null ? _buildEmpty() : _buildFileView(),
      ),
    );
  }

  _pick() async {
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        if (kIsWeb) {
          var bytes = result.files.single.bytes;
          image = MemoryImage(bytes!);
        } else {
          var file = File(result.files.single.path!);
          image = FileImage(file);
        }
      });
    }
  }

  _pick2() async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.camera);
    // if (result.isEmpty) return;
    // final List<XFile>? files = result.files;
    // if (files != null) {

    // }
  }

  _delete() async {
    Modal.show(
      content: "您确认删除此图片吗？",
      onOk: () {
        image = null;
        setState(() {});
      },
    );
  }

  _buildEmpty() {
    return GestureDetector(
      onTap: _pick2,
      child: Container(
        color: Colors.transparent,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  _buildFileView() {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          child: Image(
            image: image!,
            fit: BoxFit.cover,
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return PhotoView(
                  imageProvider: image,
                );
              },
            );
          },
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: _delete,
          ),
        )
      ],
    );
  }
}
