part of apis;

class _AppApi {
  final uploadImage = post<List>(
    "/file/upload/image",
  );
  final uploadVideo = post<List>(
    "/file/upload/video",
  );

  // final upload = http.post<String>(
  //   "/file/upload/image",
  //   null,
  //   HttpOptions(
  //     dataType: HttpDataType.form,
  //   ),
  // );
}

final appApi = _AppApi();
