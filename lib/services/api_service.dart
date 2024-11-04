import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:photo_app/models/account_update_request.dart';
import 'package:photo_app/models/auth_request.dart';
import 'package:photo_app/models/create_image_request.dart';
import 'package:photo_app/models/register_request.dart';
import 'package:photo_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/config.dart';
import '../models/token_pair_response.dart';
import 'api_client.dart';

class ApiService {
  final ApiClient _client = ApiClient();
  final Dio _unAuthClient = Dio(BaseOptions(baseUrl: Config.baseUrl));

  // POST-запрос для авторизации пользователя
  Future<bool> loginUser(AuthRequest authRequest) async {
    try {
      // Отправляем запрос
      var response =
          await _unAuthClient.post('/login', data: authRequest.toJson());

      // Проверяем статус ответа
      if (response.statusCode == 200) {
        // Анмаршалим JSON-ответ в TokenPairResponse
        TokenPairResponse tokenPair = TokenPairResponse.fromJson(response.data);

        // Сохраняем токены в SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', tokenPair.accessToken);
        await prefs.setString('refreshToken', tokenPair.refreshToken);
        await prefs.setBool(
            'authorized', true); //на всякий вдруг потом пригодиться

        return true;
        //TODO оторбражать на экране ошибку авторизации, когда нибудь
      } else {
        print("Ошибка при входе: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Ошибка: $e");
      return false;
    }
  }

  // POST-запрос для регистрации пользователя
  Future<bool> registerUser(RegisterRequest registerRequest) async {
    print("Попытка регистрации");
    try {
      var response =
          await _unAuthClient.post('/register', data: registerRequest.toJson());

      if (response.statusCode == 200) {
        print("Регистрация прошла успешно");
        return true;
      } else {
        print(
            "Ошибка регистрации: ${response.statusCode}, ${response.data['message']}");
      }
    } on DioException catch (e) {
      // Проверяем, произошла ли ошибка на уровне HTTP-запроса
      if (e.response != null) {
        print(
            "Ошибка HTTP-запроса: ${e.response?.statusCode}, ${e.response?.data['message']}");
      } else {
        print("Ошибка при подключении: ${e.message}");
      }
    } catch (e) {
      // Обработка любой другой ошибки
      print("Ошибка регистрации: $e");
    }

    return false;
  }

  // POST-запрос для обновления данных пользователя
  Future<bool> accountUpdate(AccountUpdateRequest accountUpdateRequest) async {
    print("Попытка обновления данных пользователя");
    try {
      var response = await _client.dio
          .put('/user/me', data: accountUpdateRequest.toJson());

      if (response.statusCode == 200) {
        print("Обновление данных пользователя прошло успешно");
        return true;
      } else {
        print(
            "Ошибка обновления данных пользователя: ${response.statusCode}, ${response.data['message']}");
      }
    } on DioException catch (e) {
      // Проверяем, произошла ли ошибка на уровне HTTP-запроса
      if (e.response != null) {
        print(
            "Ошибка HTTP-запроса: ${e.response?.statusCode}, ${e.response?.data['message']}");
      } else {
        print("Ошибка при подключении: ${e.message}");
      }
    } catch (e) {
      // Обработка любой другой ошибки
      print("Ошибка регистрации: $e");
    }

    return false;
  }

  // GET-запрос для получения данных своего пользователя
  Future<UserModel> fetchCurrentUserData() async {
    try {
      var response = await _client.dio.get('/user/me');
      UserModel user = UserModel.fromJson(response.data);
      return user;
    } catch (e) {
      print("Ошибка при получении данных пользователя: $e");
      rethrow;
    }
  }

  // GET-запрос для получения данных пользователя
  Future<UserModel> fetchUserData(int userId) async {
    try {
      var response = await _client.dio.get('/user/$userId');
      UserModel user = UserModel.fromJson(response.data);
      return user;
    } catch (e) {
      print("Ошибка при получении данных пользователя: $e");
      rethrow;
    }
  }

  // POST-запрос для создания нового изображения
  Future<bool> createImage(CreateImageRequest createImageRequest) async {
    print("Попытка создания нового изображения");
    try {
      var response =
      await _client.dio.post('/images/create', data: createImageRequest.toJson());

      if (response.statusCode == 200) {
        print("Создание нового изображения прошло успешно");
        return true;
      } else {
        print(
            "Ошибка создания нового изображения: ${response.statusCode}, ${response.data['message']}");
      }
    } on DioException catch (e) {
      // Проверяем, произошла ли ошибка на уровне HTTP-запроса
      if (e.response != null) {
        print(
            "Ошибка HTTP-запроса: ${e.response?.statusCode}, ${e.response?.data['message']}");
      } else {
        print("Ошибка при подключении: ${e.message}");
      }
    } catch (e) {
      // Обработка любой другой ошибки
      print("Ошибка создания нового изображения: $e");
    }

    return false;
  }

////////////////////////////////////////////////////////
  // PUT-запрос для обновления данных пользователя
  // Future<Response> updateUser(
  //     String userId, Map<String, dynamic> userData) async {
  //   try {
  //     return await _client.dio.put('/user/$userId', data: userData);
  //   } catch (e) {
  //     print("Ошибка при обновлении пользователя: $e");
  //     rethrow;
  //   }
  // }
  //
  // // DELETE-запрос для удаления пользователя
  // Future<Response> deleteUser(String userId) async {
  //   try {
  //     return await _client.dio.delete('/user/$userId');
  //   } catch (e) {
  //     print("Ошибка при удалении пользователя: $e");
  //     rethrow;
  //   }
  // }
}
