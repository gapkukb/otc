part of apis;

class _AppApi {
  final uploadImage = post<List>(
    "/file/upload/image",
    null,
    HttpOptions(loading: false),
  );
  final uploadVideo = post<List>(
    "/file/upload/video",
    null,
    HttpOptions(loading: false),
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
