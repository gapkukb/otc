import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:photo_view/photo_view.dart';

class UiFilePickerController extends ChangeNotifier {}

class UiFilePicker extends StatefulWidget {
  final Function(File? file) onChange;
  const UiFilePicker({
    super.key,
    required this.onChange,
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
    return DottedBorder(
      dashPattern: const [4],
      strokeWidth: 0.3,
      strokeCap: StrokeCap.round,
      child: SizedBox(
        width: 100,
        height: 100,
        child: file == null ? _buildEmpty() : _buildImageView(),
      ),
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

  _crop() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      cropStyle: CropStyle.circle,
      sourcePath: file!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          dimmedLayerColor: Colors.black,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    setState(() {
      file = File(croppedFile!.path);
    });
  }

  _buildEmpty() {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: GestureDetector(
        onTap: _pick,
        child: const Icon(
          Icons.add,
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
          child: Image(
            image: FileImage(file!),
            fit: BoxFit.cover,
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Stack(
                  key: ValueKey(file!.path),
                  fit: StackFit.expand,
                  children: [
                    PhotoView(
                      imageProvider: FileImage(file!),
                      wantKeepAlive: false,
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            minWidth: 0,
                            visualDensity: VisualDensity.compact,
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            onPressed: _crop,
                            child: const Text("编辑"),
                          ),
                          MaterialButton(
                            minWidth: 0,
                            visualDensity: VisualDensity.compact,
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: _crop,
                            child: const Text("使用"),
                          )
                        ],
                      ),
                    )
                  ],
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
