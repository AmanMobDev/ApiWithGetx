import 'package:dio/dio.dart';

class EndpointCallingService {
  Dio? _dio;

  EndpointCallingService() {
    _dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api/"));
    initializeInterceptors();
  }

  Future<Response> getDataRequest(String url) async {
    Response response;
    try {
      response = await _dio!.get(url);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onError: (error, errorInterceptorHandler) {
          print("onError ${error.message}");
          return errorInterceptorHandler.next(error);
        },
        onRequest: (request, requestInterceptorHandler) {
          print("onRequest ${request.method} | ${request.uri}");
          return requestInterceptorHandler.next(request);
        },
        onResponse: (response, responseInterceptorHandler) {
          print(
              "onResponse ${response.statusCode} ${response.statusMessage} ${response.data}");
          return responseInterceptorHandler.next(response);
        },
      ),
    );
  }
}
