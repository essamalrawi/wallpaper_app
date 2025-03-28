import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/utils/keys.dart';

class ApiService {
  final _baseUrl = 'https://api.pexels.com/v1/';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required endPoint}) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(headers: {'Authorization': apiKey}),
    );
    return response.data;
  }
}
