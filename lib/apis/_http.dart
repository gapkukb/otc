part of apis;

final _http = Http(HttpOptions(
  receiveTimeout: Duration(seconds: 10),
  baseUrl: "https://segmentfault.com",
  headers: {
    'X-RapidAPI-Key': 'SIGN-UP-FOR-KEY',
    'X-RapidAPI-Host': 'imdb8.p.rapidapi.com',
  },
));

final get = _http.newMethod("get");
final post = _http.newMethod("post");
