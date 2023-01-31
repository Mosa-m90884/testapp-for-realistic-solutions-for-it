import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Api {
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'https://event-reg.app/flutter_test/api',
      receiveDataWhenStatusError: true,
    ),
  );

  static void initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        var token = await GetStorage().read('login_token');
        print(token);

        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}',
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
      onError: (error, handler,) {
        print(handler.toString());
        return handler.next(error); //continue
      },
    ));
  } // end of initializeInterceptor

  static Future<Response> getProducts() async {
    return dio.get('/products',);
  } //end of actors
  static Future<Response> getOrders() async {
    return dio.get('/orders',);
  }
  static Future<Response> register(
      {required Map<String, dynamic> registerData}) async {
    FormData formData = FormData.fromMap(registerData);
    return dio.post('/register', data: formData);
  } //end of register
  static Future<Response> placeOrder(
      {required Map<String, dynamic> orderData}) async {
    FormData formData = FormData.fromMap(orderData);
    return dio.post('/orders', data: formData);
  }
  static Future<Response> deleteOrder(int id) async {
    return dio.delete('/orders/${id}',);
  }
  static Future<Response> login({required Map<String, dynamic> loginData}) async {
    FormData formData = FormData.fromMap(loginData);
    return dio.post('/login', data: formData);
  }
  static Future<Response> productFilter({required Map<String, dynamic> data}) async {
    FormData formData = FormData.fromMap(data);
    return dio.post('/filter-products', data: formData);
  }
} //end of api
