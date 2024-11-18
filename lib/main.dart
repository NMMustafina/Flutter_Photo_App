import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:photo_app/models/models.dart';
import 'package:photo_app/app/photo_app.dart';
import 'package:photo_app/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator.setup();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
        // Можно добавить и другие провайдеры при необходимости
      ],
      child: const PhotoApp(),
    ),
  );
}
