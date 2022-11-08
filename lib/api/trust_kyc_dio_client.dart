import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logging/logging.dart';
import 'package:trust_money/api/trust_kyc_url.dart';
import '../utils/sharedPreference.dart';
import 'network_exception.dart';

class TrustKycDioClient {
  final logger = Logger("TrustKycDioClient");
  late Dio _dio;

/*  var loginToken =  HelperFunctions.getToken().then((loginToken) {
    var sessionToken =  HelperFunctions.getRefreshToken().then((sessionToken) {
      if (loginToken.isNotEmpty) {
        headers[HttpHeaders.authorizationHeader] = loginToken;
      } else if (sessionToken.isNotEmpty) {
        headers[HttpHeaders.authorizationHeader] = sessionToken;
      }
      BaseOptions options = BaseOptions(baseUrl: TrustKycUrl.baseUrl, headers: headers);
      //TODO: Authentication issue should be handled here
      // _dio.interceptors.clear();
      // _dio.interceptors.add(InterceptorsWrapper(onRequest: (options,handler) {
      //   return handler.next(options);
      // },onResponse: (response,handler){
      //   return handler.next(response);
      // },onError: (DioError e,handler){
      //   if(e.response?.statusCode == 401) {
      //     // handler.
      //   }
      // }));
      _dio = Dio(options);
    });
  });*/

  TrustKycDioClient(String token) {
    Map<String, dynamic> headers = {
      HttpHeaders.contentTypeHeader: Headers.jsonContentType,
      HttpHeaders.authorizationHeader: token
    };
    BaseOptions options =
        BaseOptions(baseUrl: TrustKycUrl.baseUrl, headers: headers);
    //TODO: Authentication issue should be handled here
    // _dio.interceptors.clear();
    // _dio.interceptors.add(InterceptorsWrapper(onRequest: (options,handler) {
    //   return handler.next(options);
    // },onResponse: (response,handler){
    //   return handler.next(response);
    // },onError: (DioError e,handler){
    //   if(e.response?.statusCode == 401) {
    //     // handler.
    //   }
    // }));
    _dio = Dio(options);
  }

  Dio get dioClient => _dio;

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    logger.info(
        "TOKEN+ ${_dio.options.headers[HttpHeaders.authorizationHeader]}");
    try {
      var response = await _dio.get(endpoint, queryParameters: query);
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        //token expired
        // var resData = e.response?.data as Map<String, dynamic>;
        // Fluttertoast.showToast(msg: resData['errors']);
      } else if (e.response?.statusCode == 400) {
        var resData = e.response?.data as Map<String, dynamic>;
        Fluttertoast.showToast(msg: resData['errors']);
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
    // return await _dio.post(endpoint, data: body, queryParameters: query);
    try {
      var response = await _dio.post(endpoint, data: body, queryParameters: query);
      print("statusCode " + response.statusCode.toString());
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // var resData = e.response?.data as Map<String, dynamic>;
        // Fluttertoast.showToast(msg: resData['errors']);
       // Fluttertoast.showToast(msg: resData['errors'][0]);
      } else if (e.response?.statusCode == 400) {
        var resData = e.response?.data as Map<String, dynamic>;
        Fluttertoast.showToast(msg:resData['errors']);
        throw RequestException(resData['errors']);
      }
      throw ServerException(e.response?.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // Future<Response> put(
  //     {required String endpoint,
  //     Map<String, dynamic>? body,
  //     Map<String, dynamic>? query}) async {
  //   return await _dio.put(endpoint, data: body, queryParameters: query);
  // }

  Future<Response> put({required String endpoint, Map<String, dynamic>? body, Map<String, dynamic>? query}) async {
    try {
      var response = await _dio.put(endpoint, data: body, queryParameters: query);
      return response;
    } on DioError catch (e) {

      if (e.response?.statusCode == 401) {
        //token expired

      } else if(e.response?.statusCode == 400) {
        var resData = e.response?.data as Map<String,dynamic>;
        Fluttertoast.showToast(msg:resData['errors']);
        throw RequestException(resData['errors']);
      }
      throw ServerException(e.response?.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
    // return await _dio.put(endpoint, data: body, queryParameters: query);
  }

  Future<Response> delete({required String endpoint,Map<String, dynamic>? body, Map<String, dynamic>? query}) async {
    try {
      var response =  _dio.delete(endpoint, data: body, queryParameters: query);
      return response;
    } on DioError catch (e) {

      if (e.response?.statusCode == 401) {
        //token expired

      } else if(e.response?.statusCode == 400) {
        print("400 error");
        var resData = e.response?.data as Map<String,dynamic>;
        Fluttertoast.showToast(msg:resData['errors']);
        throw RequestException(resData['errors']);
      }
      throw ServerException(e.response?.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
    // return await _dio.delete(endpoint, data: body, queryParameters: query);
  }
  //
  // Future<Response> delete({required String endpoint, Map<String, dynamic>? query}) async {
  //   return await _dio.delete(endpoint, queryParameters: query);
  // }

  Future<Response> upload({required String endpoint, FormData? data}) async {
    return await _dio.post(endpoint, data: data);
  }
}
