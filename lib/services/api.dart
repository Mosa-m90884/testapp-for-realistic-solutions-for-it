import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'https://fakestoreapi.com',
      receiveDataWhenStatusError: true,
    ),
  );

  static void initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        };

        request.headers.addAll(headers);
        print('${request.method} ${request.path}');
        print('${request.headers}');
        return handler.next(request); //continue
      },
      onResponse: (response, handler) {
        print('${response.data}');
        if (response.data['error'] == 1) throw response.data['message'];

        return handler.next(response); // continue
      },
      onError: (error, handler) {
        return handler.next(error); //continue
      },
    ));
  } // end of initializeInterceptor

  static Future<Response> getProducts() async {
    return dio.get('/products');
  } //end of actors

  static Future<Response> register(
      {required Map<String, dynamic> registerData}) async {
    FormData formData = FormData.fromMap(registerData);
    return dio.post('/api/register', data: formData);
  } //end of register

  static Future<Response> getUser() async {
    return dio.get('/api/user');
  } //end of getUser

} //end of api
