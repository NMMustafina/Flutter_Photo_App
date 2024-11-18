import 'package:flutter/material.dart';
import 'package:photo_app/routes/routes.dart';
import 'package:photo_app/theme/app_theme.dart';

class PhotoApp extends StatelessWidget {
  const PhotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo App',
      theme: AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.system, // Поддержка переключения светлой и тёмной тем
      initialRoute: '/',
      routes: routes,
    );
  }
}