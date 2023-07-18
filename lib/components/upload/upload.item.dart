part of upload;

enum UploadingState {
  idle,
  uploading,
  done,
  error,
}

class StateFile {
  final File file;
  final UploadingState state;
  final String url;

  StateFile({
    required this.file,
    required this.state,
    required this.url,
  });
}

class UploadItem extends StatefulWidget {
  final Function(StateFile? stateFile)? onChange;
  final double? size;
  const UploadItem({
    super.key,
    this.onChange,
    this.size,
  });

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
  double process = 0.5;
  UploadingState state = UploadingState.idle;
  File? file;

  final errorView = Positioned(
    right: 0,
    left: 0,
    top: 0,
    bottom: 0,
    child: GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.black38,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.error_outline, color: Colors.white),
            Text(
              "上传失败\n点击重试",
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          children: [
            Material(
              color: Colors.amber,
              child: UiFilePicker(
                onChange: (file) {
                  if (file == null) {
                    widget.onChange?.call(null);
                  } else {
                    widget.onChange?.call(
                      StateFile(
                        file: file,
                        state: state,
                        url: "",
                      ),
                    );
                  }
                },
              ),
            ),
            if (state != UploadingState.idle)
              state == UploadingState.uploading
                  ? UploadItemUploading(process: process)
                  : errorView
          ],
        ),
      ),
    );
  }

  upload() async {
    try {
      final source = await MultipartFile.fromFile(file!.path);
      final url = await apis.app.uploadImage({"file": source});
      setState(() {
        state = UploadingState.uploading;
        // widget.onChange?.call(url);
      });
    } catch (e) {
      setState(() {
        state = UploadingState.error;
        // widget.onChange?.call(e);
      });
    }
  }
}

class UploadItemUploading extends StatelessWidget {
  final double process;
  const UploadItemUploading({
    super.key,
    required this.process,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Positioned(
        child: Container(
          color: Colors.black45,
          child: Stack(
            children: [
              Center(
                child: CircularProgressIndicator(
                  value: process,
                  backgroundColor: Colors.white,
                  strokeWidth: 2,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Center(
                child: Text(
                  "${(process * 100).toInt()}%",
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
