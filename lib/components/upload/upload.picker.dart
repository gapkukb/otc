import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:photo_view/photo_view.dart';

enum UploadingState {
  idle,
  uploading,
  done,
  error,
}

class UiFilePickerController extends ChangeNotifier {}

class UploadPicker extends StatefulWidget {
  final Function(File? file) onChange;
  final String? title;
  final Widget? titleWidget;
  final double size;
  final double process;
  final UploadingState state;
  const UploadPicker({super.key, required this.onChange, this.title, this.titleWidget, this.size = 100, this.process = 0, this.state = UploadingState.idle});

  @override
  State<UploadPicker> createState() => _UploadPickerState();
}

class _UploadPickerState extends State<UploadPicker> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(widget.title!),
          ),
        DottedBorder(
          dashPattern: const [4],
          radius: const Radius.circular(4),
          strokeWidth: 0.3,
          strokeCap: StrokeCap.round,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: file == null ? emtpyView() : imageView(),
            ),
          ),
        )
      ],
    );
  }

  GestureDetector emtpyView() {
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

  Stack imageView() {
    return Stack(
      key: ValueKey(file!.path),
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.black38,
          child: Image(
            image: FileImage(file!),
            fit: BoxFit.contain,
          ),
        ),
        if (widget.state != UploadingState.idle) stateView(),
        if (widget.state != UploadingState.uploading) deleteView(),
      ],
    );
  }

  Positioned deleteView() {
    return Positioned(
      right: -10,
      top: -10,
      child: IconButton(
        icon: const Icon(
          Icons.cancel_rounded,
          color: Colors.white,
        ),
        onPressed: _delete,
      ),
    );
  }

  Positioned stateView() {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      left: 0,
      child: GestureDetector(
        onTap: () {
          if (widget.state == UploadingState.error) {
            Modal.alert(content: "daf");
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return PhotoView(
                  imageProvider: FileImage(file!),
                  wantKeepAlive: false,
                );
              },
            );
          }
        },
        child: Material(
          color: Colors.black45,
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 12, color: Colors.white),
            child: widget.state == UploadingState.uploading
                ? uploadingView()
                : widget.state == UploadingState.error
                    ? errorView()
                    : doneView(),
          ),
        ),
      ),
    );
  }

  uploadingView() {
    return Stack(
      children: [
        Center(
          child: CircularProgressIndicator(
            value: widget.process > 0 ? widget.process : null,
            backgroundColor: Colors.white,
            strokeWidth: 2,
            color: Colors.white,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
        Center(
          child: Text("${(widget.process * 100).toInt()}%"),
        ),
      ],
    );
  }

  errorView() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [Icon(Icons.error_outline, color: Colors.white), Text("上传失败\n点击重试")],
    );
  }

  doneView() {
    return const Center(
      child: Text("上传完成"),
    );
  }

  _delete() async {
    Modal.confirm(
      content: "您确认删除此图片吗？",
      onOk: () {
        _onChange(null);
      },
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
          final ImageSource source = value ? ImageSource.camera : ImageSource.gallery;

          final result = await picker.pickImage(
            source: source,
            imageQuality: 80,
            maxWidth: 1080,
            maxHeight: 720,
          );
          if (result != null) {
            _onChange(File(result.path));
          }
        },
      );
    }
  }

  _onChange(File? newFile) {
    setState(() {
      file = newFile;
    });
    widget.onChange(newFile);
  }
}
