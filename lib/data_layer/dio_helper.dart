import 'package:dio/dio.dart';
class DioHelper {
  late final Dio _dio;
  final baseURL="http://zedny-3lma.coolpage.biz/api/";

  DioHelper(){
    _dio=Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) => true,
        baseUrl:
        "http://zedny-3lma.coolpage.biz/api/",
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }
  //  init() {
  //   _dio = Dio(
  //     BaseOptions(
  //       followRedirects: false,
  //       validateStatus: (status) => true,
  //       baseUrl: baseURL,
  //       receiveDataWhenStatusError: true,
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //     ),
  //   );
  // }

   Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String ? bearerToken,
  }) async {
    _dio.options.headers = {
      if(bearerToken != null)
        'Authorization':'Bearer $bearerToken',
    };
    return await _dio.get(
      url,
      queryParameters: query,
    );
  }

   Future<Response?> download({
    required String url,
    required String path,
    String ? bearerToken,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      if(bearerToken != null)
        'Authorization':'Bearer $bearerToken',
    };
    return await _dio.download(
      url,
      path ,
      queryParameters: query,
    );
  }


   Future<Response?> postData({
    required String url,
    Map<String, dynamic>? query,
     dynamic data,
    String ? bearerToken,
  }) async {
    _dio.options.headers = {
      if(bearerToken != null)
        'Authorization':'Bearer $bearerToken',
    };
    return await _dio.post(
      url,
      queryParameters: query,
      data: data,

    );
  }

   Future<Response?> patchData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    String ? bearerToken,
  }) async {
    _dio.options.headers = {
      if(bearerToken != null)
        'Authorization':'Bearer $bearerToken',
    };
    return await _dio.patch(
      url,
      queryParameters: query,
      data: data,

    );
  }


   Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    String ? bearerToken,
  }) async {
    _dio.options.headers = {
      if(bearerToken != null)
        'Authorization':'Bearer $bearerToken',
    };
    return await _dio.delete(
      url,
      queryParameters: query,
      data: data,

    );
  }
   Future<Response?> putData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    String ? bearerToken,
  }) async {
    _dio.options.headers = {
      if(bearerToken != null)
        'Authorization':'Bearer $bearerToken',
    };
    return await _dio.put(
      url,
      queryParameters: query,
      data: data,

    );
  }

/*   Future<Response?> download({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    required File file,
    String ? bearerToken,
  }) async {
    _dio?.options.headers = {
      if(bearerToken != null)
        'Authorization':'Bearer $bearerToken',
    };
    return await _dio?.download(
      url,
      file,
      onReceiveProgress: (received,total) {

        int progress = (((received / total) * 100).toInt());

        print(progress);

        final url = file.path;

        //OpenFile.open(url);


      },
      queryParameters: query,
      data: data,

    );
  }*/

}
