import 'package:get_it/get_it.dart';
import 'api_service.dart';
import 'api_client.dart';

class ServiceLocator {
  static final getIt = GetIt.instance;

  static void setup() {
    getIt.registerLazySingleton<ApiClient>(() => ApiClient());
    getIt.registerLazySingleton<ApiService>(() => ApiService());
  }
}
