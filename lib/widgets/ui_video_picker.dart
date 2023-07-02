import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:photo_view/photo_view.dart';
import 'package:video_player/video_player.dart';

class UiVideoPicker extends StatefulWidget {
  const UiVideoPicker({super.key});

  @override
  State<UiVideoPicker> createState() => _UiVideoPickerState();
}

class _UiVideoPickerState extends State<UiVideoPicker> {
  File? file;
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    file = null;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AspectRatio(
        aspectRatio: 1,
        child: DottedBorder(
          dashPattern: const [4],
          strokeWidth: 0.3,
          strokeCap: StrokeCap.round,
          child: Container(
            child: file == null ? _buildEmpty() : _buildImageView(),
          ),
        ),
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

          final result = await picker.pickVideo(
            source: source,
          );
          if (result != null) {
            setState(() {
              file = File(result.path);
            });
          }
        },
      );
    }
  }

  _delete() async {
    Modal.confirm(
      content: "您确认删除此图片吗？",
      onOk: () {
        setState(() {
          file = null;
        });
      },
    );
  }

  _buildEmpty() {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: InkWell(
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
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Container(),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(
                      _controller..play(),
                    ),
                  ),
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
