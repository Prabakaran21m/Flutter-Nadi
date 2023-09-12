import 'dart:io';

import 'package:code/api/theme_widget.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetX;

enum Method { POST, GET, PUT, DELETE, PATCH }

const bool isProductionUrl = true;

const String BASE_URL = isProductionUrl
    ? "https://mdqualityapps.in/API/nadi/UAT/"
    : "https://mdqualityapps.com/nadi/nadidevelopment/UAT/";

class HttpService {
  Map<String, String> headers = {"Content-Type": "application/json"};
  late Dio _dio;
  Future<HttpService> init({bool enableAuth = true}) async {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: headers));
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          print(
              "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          print("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          print("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response? response;
    try {
      if (method == Method.POST) {
        FormData formData = FormData.fromMap(params!);
        response = await GetX.Get.showOverlay(
            asyncFunction: () => _dio.post(url, data: formData),
            loadingWidget: loadingWidget());

        initInterceptors();

        print("url" + url);
        print(params);
      } else if (method == Method.GET) {
        response = await GetX.Get.showOverlay(
            asyncFunction: () => _dio.get(url), loadingWidget: loadingWidget());
      } else if (method == Method.PUT) {
        response = await GetX.Get.showOverlay(
            asyncFunction: () => _dio.put(url, data: params),
            loadingWidget: loadingWidget());
      } else {
        response = await GetX.Get.showOverlay(
            asyncFunction: () => _dio.get(url, queryParameters: params),
            loadingWidget: loadingWidget());
      }
      if (response?.statusCode == 200) {
        return response;
      } else if (response?.statusCode == 400) {
        throw Exception("Bad Request");
      } else if (response?.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response?.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    }
    on SocketException catch (e) {
      print(e);
      throw Exception("Not Internet Connection");
    }
  }}
