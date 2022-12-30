import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:trust_money/api/trust_kyc_url.dart';
import '../utils/helper_widget/custom_snsckbar.dart';
import 'network_exception.dart';

class TrustKycDioClient {
  late Dio _dio;
  TrustKycDioClient(String token) {
    Map<String, dynamic> headers = {
      HttpHeaders.contentTypeHeader: Headers.jsonContentType,
      HttpHeaders.authorizationHeader: token
    };

    BaseOptions options = BaseOptions(baseUrl: TrustKycUrl.baseUrl, headers: headers);
    _dio = Dio(options);
  }

  Dio get dioClient => _dio;

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    debugPrint("=============token ${_dio.options.headers[HttpHeaders.authorizationHeader]}");
    try {
      var response = await _dio.get(endpoint, queryParameters: query);
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
      } else if (e.response?.statusCode == 400) {
        var resData = e.response?.data as Map<String, dynamic>;
        ShowCustomSnackBar().ErrorSnackBar(resData['errors']);
        throw RequestException(resData['errors']);
      }
      throw ServerException(e.response?.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Response> post(
      {required String endpoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? query}) async {
    try {
      var response = await _dio.post(endpoint, data: body, queryParameters: query);

      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
      } else if (e.response?.statusCode == 400) {
        var resData = e.response?.data as Map<String, dynamic>;
        ShowCustomSnackBar().ErrorSnackBar(resData['errors']);
        throw RequestException(resData['errors']);
      }
      throw ServerException(e.response?.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Response> put({required String endpoint, Map<String, dynamic>? body, Map<String, dynamic>? query}) async {
    debugPrint("=============token ${_dio.options.headers[HttpHeaders.authorizationHeader]}");
    try {
      var response = await _dio.put(endpoint, data: body, queryParameters: query);
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        //token expired
      } else if(e.response?.statusCode == 400) {
        var resData = e.response?.data as Map<String,dynamic>;
        ShowCustomSnackBar().ErrorSnackBar(resData['errors']);
        throw RequestException(resData['errors']);
      }
      throw ServerException(e.response?.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
    // return await _dio.put(endpoint, data: body, queryParameters: query);
  }

  Future<Response> delete({required String endpoint,Map<String, dynamic>? body, Map<String, dynamic>? query}) async {
    debugPrint("=============token ${_dio.options.headers[HttpHeaders.authorizationHeader]}");
    try {
      var response =  _dio.delete(endpoint, data: body, queryParameters: query);
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
      } else if(e.response?.statusCode == 400) {
        print("400 error");
        var resData = e.response?.data as Map<String,dynamic>;
        ShowCustomSnackBar().ErrorSnackBar(resData['errors']);
        throw RequestException(resData['errors']);
      }
      throw ServerException(e.response?.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Response> upload({required String endpoint, FormData? data}) async {
    debugPrint("=============token ${_dio.options.headers[HttpHeaders.authorizationHeader]}");
    return await _dio.post(endpoint, data: data);
  }
}
