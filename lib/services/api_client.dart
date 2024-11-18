import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:photo_app/config/config.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

  ApiClient() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Получаем Access токен из SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        String? accessToken = prefs.getString('accessToken');
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options); // Продолжаем выполнение запроса
      },
      onError: (DioException error, handler) async {
        // Используем DioException вместо DioError
        // Проверяем, если ошибка 401 (не авторизован), пробуем обновить токен
        if (error.response?.statusCode == 401) {
          bool isTokenRefreshed = await _refreshToken();
          if (isTokenRefreshed) {
            // Если токен обновлён, повторяем оригинальный запрос с новым токеном
            final options = error.requestOptions;
            final prefs = await SharedPreferences.getInstance();
            options.headers['Authorization'] =
                'Bearer ${prefs.getString('accessToken')}';
            final response = await _dio.fetch(options);
            return handler.resolve(response);
          }
        }
        return handler.next(error); // Если не 401, продолжаем обработку ошибки
      },
    ));
  }

  // Метод для обновления токена
  Future<bool> _refreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? refreshToken = prefs.getString('refreshToken');

      if (refreshToken != null) {
        final response = await _dio.post('/refresh', data: refreshToken);

        if (response.statusCode == 200) {
          // Обновляем Access и Refresh токены
          prefs.setString('accessToken', response.data['accessToken']);
          prefs.setString('refreshToken', response.data['refreshToken']);
          return true;
        }

      }
    } catch (e) {
      debugPrint("Ошибка при обновлении токена: $e");
    }
    return false;
  }

  Dio get dio => _dio;
}
