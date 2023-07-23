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
  final Future Function() upload;

  StateFile({
    required this.file,
    required this.state,
    required this.url,
    required this.upload,
  });
}

class UploadItem extends StatefulWidget {
  final String? title;
  final Function(StateFile? stateFile)? onChange;
  final double? size;
  const UploadItem({
    super.key,
    this.onChange,
    this.size,
    this.title,
  });

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
  double process = 0;
  UploadingState state = UploadingState.idle;
  File? file;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: SizedBox(
        width: widget.size,
        // height: widget.size,
        child: Stack(
          children: [
            Material(
              // color: Colors.amber,
              child: UiFilePicker(
                size: widget.size,
                title: widget.title,
                onChange: (newFile) {
                  if (newFile == null) {
                    widget.onChange?.call(null);
                    file = null;
                  } else {
                    file = newFile;
                    widget.onChange?.call(
                      StateFile(
                        file: newFile,
                        state: state,
                        url: "",
                        upload: upload,
                      ),
                    );
                  }
                },
              ),
            ),
            if (state != UploadingState.idle)
              UploadItemOverlay(
                process: process,
                state: state,
              )
          ],
        ),
      ),
    );
  }

  preupload() {}

  Future<String> upload() async {
    try {
      final stream = await MultipartFile.fromFile(file!.path);
      final List<String> url = await apis.app.upload(
        {"file": stream},
        HttpOptions(
          onSendProgress: (count, total) {
            setState(() {
              process = count / total;
              state = UploadingState.uploading;
            });
          },
        ),
      );
      setState(() {
        state = UploadingState.done;
      });
      return url[0];
    } catch (e) {
      setState(() {
        state = UploadingState.error;
      });
      return Future.error(e);
    }
  }

  pause() {}

  cancel() {}
}

class UploadItemOverlay extends StatelessWidget {
  final double process;
  final UploadingState state;
  const UploadItemOverlay({
    super.key,
    required this.process,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: 0,
      bottom: 0,
      child: IgnorePointer(
        ignoring: state != UploadingState.uploading,
        child: Container(
          color: Colors.black45,
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 12, color: Colors.white),
            child: state == UploadingState.uploading
                ? uploadingView()
                : state == UploadingState.error
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
            value: process > 0 ? process : null,
            backgroundColor: Colors.white,
            strokeWidth: 2,
            color: Colors.white,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
        Center(
          child: Text("${(process * 100).toInt()}%"),
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
}
