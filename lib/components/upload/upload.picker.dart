part of upload;

enum UploadingState {
  idle,
  uploading,
  done,
  error,
}

enum MediaType {
  image,
  video,
}

class UiFilePickerController extends ChangeNotifier {}

class UploadPicker extends StatefulWidget {
  final Function(XFile? file) onChange;
  final String? title;
  final Widget? titleWidget;
  final double size;
  final double process;
  final UploadingState state;
  final MediaType? mediaType;
  const UploadPicker({
    super.key,
    required this.onChange,
    this.title,
    this.titleWidget,
    this.size = 100,
    this.process = 0,
    this.state = UploadingState.idle,
    this.mediaType = MediaType.image,
  });

  @override
  State<UploadPicker> createState() => _UploadPickerState();
}

class _UploadPickerState extends State<UploadPicker> {
  XFile? file;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    file = null;
    _controller?.dispose();
    super.dispose();
  }

  bool get isImage {
    return (widget.mediaType ?? MediaType.image) == MediaType.image;
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
    final imageProvider = (kIsWeb ? NetworkImage(file!.path) : FileImage(File(file!.path))) as ImageProvider;
    return Stack(
      key: ValueKey(file!.path),
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: () {
            if (isImage) {
              showDialog(
                context: context,
                builder: (context) {
                  return PhotoView(
                    imageProvider: imageProvider,
                    wantKeepAlive: false,
                  );
                },
              );
            } else {
              _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
            }
          },
          child: Container(
            color: Colors.black38,
            child: isImage
                ? Image(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  )
                : VideoPlayer(_controller!),
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

  Widget stateView() {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      left: 0,
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
    if (kIsWeb) {
      _picking(ImageSource.camera);
    } else {
      Modal.showBottomSheet(
        items: [
          BottomSheetItem(label: isImage ? "拍照" : "录像", value: true),
          BottomSheetItem(label: "从相册选择", value: false),
        ],
        onSelected: (value, _) async {
          final ImageSource source = value ? ImageSource.camera : ImageSource.gallery;
          _picking(source);
        },
      );
    }
  }

  _picking(ImageSource source) async {
    final picker = ImagePicker();
    final result = await (isImage ? picker.pickImage : picker.pickVideo)(
      source: source,
    );

    if (result != null) {
      if (isImage) {
        _onChange(result);
      } else {
        _controller = VideoPlayerController.network(result.path)
          ..initialize().then(
            (_) {
              _onChange(result);
            },
          );
      }
    }
  }

  _onChange(XFile? newFile) {
    setState(() {
      file = newFile;
      if (file != null && !isImage) {
        _controller!.play();
      }
      widget.onChange(newFile);
    });
  }
}
