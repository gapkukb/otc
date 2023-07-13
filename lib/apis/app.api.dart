part of apis;

class _AppApi {
  final uploadImage = post(
    "/file/upload/image",
    null,
    HttpOptions(
      dataType: HttpDataType.form,
    ),
  );
}

final appApi = _AppApi();
