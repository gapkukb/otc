// import 'package:dio/dio.dart';
// import './options.dart';

// BaseOptions _defaultOptions = BaseOptions(
//   baseUrl: '/',
//   sendTimeout: const Duration(seconds: 30),
//   connectTimeout: const Duration(seconds: 30),
//   receiveTimeout: const Duration(seconds: 30),
// );


// class Http {
//   late final Dio dio;

//   Http([BaseOptions? option]) {
//     _defaultOptions.copyWith(
//       baseUrl: option!.baseUrl,
//     );
//     dio = Dio(_defaultOptions);
//   }

//   setHeader(String key, dynamic value) {
//     dio.options.headers.update(key, (_) => value);
//   }

//   setHeaders(Map<String, dynamic> other) {
//     dio.options.headers.addAll(other);
//   }

//   extend(BaseOptions? baseOptions) {}

//   get(BaseOptions? baseOptions) {
//     var self = this;
//     return (BaseOptions? options) {
//       self.get(baseOptions);
//     };
//   }
// }

// class MethodFunction<T> {
//   late Function abort;
//   late String path;
//   late CancelToken token;
//   late String method;

//   Future<T> call([
//     Map<dynamic, dynamic>? data,
//     T? model,
//   ]) {
//     return ([
//       data,
//       finalOptions,
//     ]) {
//       return Dio()
//           .request(
//             path,
//             cancelToken: token,
//             options: Options(
//               method: method,
//             ),
//           )
//           .then(
//             (value) => {},
//           ) as dynamic;
//     } as dynamic;
//   }

//   MethodFunction(this.path, this.token, this.abort);
// }



// class Http2 {
//   // Future<T> Function([
//   //   Map<dynamic, dynamic>?,
//   //   HttpOptions?,
//   // ])

//   MethodFunction<T> Function<T>(
//     String, [
//     T?,
//     HttpOptions?,
//   ]) create(
//     String method, [
//     HttpOptions? methodOptions,
//   ]) {
//     return <T>(
//       path, [
//       model,
//       middleOptions,
//     ]) {
//       final token = CancelToken();
//       MethodFunction? handle = MethodFunction(path, token, () {
//         token.cancel('canceled');
//       });

//       return handle as dynamic;

//       // return ([
//       //   data,
//       //   finalOptions,
//       // ]) {
//       //   return Dio()
//       //       .request(
//       //         path,
//       //         options: Options(
//       //           method: method,
//       //         ),
//       //       )
//       //       .then(
//       //         (value) => {},
//       //       ) as dynamic;
//       // };
//     };
//   }
// }
