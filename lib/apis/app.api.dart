part of apis;

class _AppApi {
  final uploadImage = post<List<String>>(
    "/file/upload/image",
    null,
    HttpOptions(
      dataType: HttpDataType.form,
    ),
  );

  final upload = http.post<String>(
    "/file/upload/image",
    null,
    HttpOptions(
      dataType: HttpDataType.form,
    ),
  );
}

final appApi = _AppApi();
