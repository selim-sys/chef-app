import 'package:chefapp/view_model/network/end_points.dart';
import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        headers: {
          'Accept': 'application/json'
        }
      ),
    );
  }
  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
    ProgressCallback? onReceiveProgress

}) async {
    try{
       dio.options.headers = {};
       final Response response = await dio.get(
           endPoint,
           queryParameters: queryParameters,
           onReceiveProgress: onReceiveProgress);
       return response;
    }catch(e){
      rethrow;
    }


}
  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
    String? token,
    ProgressCallback? onReceiveProgress

  }) async {
    try{
      dio.options.headers = {};
      final Response response = await dio.get(
          endPoint,
          data: data,
          queryParameters: queryParameters,
          onReceiveProgress: onReceiveProgress);
      return response;
    }catch(e){
      rethrow;
    }
  }


}