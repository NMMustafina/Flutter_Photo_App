import 'package:flutter/material.dart';
import 'package:photo_app/screens/create_image_screen.dart';
import 'package:photo_app/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:photo_app/models/user_provider.dart';
import 'package:photo_app/services/service_locator.dart';
import 'package:photo_app/screens/account_screen.dart';
import 'package:photo_app/screens/base_screen.dart';
import 'package:photo_app/screens/chats_screen.dart';
import 'package:photo_app/screens/discover_screen.dart';
import 'package:photo_app/screens/login_screen.dart';
import 'package:photo_app/screens/search_screen.dart';
import 'package:photo_app/screens/test.dart';

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
      routes: {
        //  '/test': (context) => const MyApp(),
        '/home': (context) => const BaseScreen(),
        '/login': (context) => const LoginScreen(),
        '/discover': (context) => const DiscoverScreen(),
        '/account': (context) => const AccountScreen(),
        '/create_image': (context) => const CreateImageScreen(),
        '/search': (context) => const SearchScreen(),
        '/chats': (context) => const ChatsScreen(),
      },
    );
  }
}
