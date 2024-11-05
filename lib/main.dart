import 'package:flutter/material.dart';
import 'package:photo_app/screens/create_image_screen.dart';
import 'package:provider/provider.dart';
import 'package:photo_app/models/user_provider.dart';
import 'package:photo_app/services/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:photo_app/firebase_options.dart';
import 'package:photo_app/screens/account_screen.dart';
import 'package:photo_app/screens/base_screen.dart';
import 'package:photo_app/screens/chats_screen.dart';
import 'package:photo_app/screens/discover_screen.dart';
import 'package:photo_app/screens/login_screen.dart';
import 'package:photo_app/screens/search_results_screen.dart';
import 'package:photo_app/screens/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const BaseScreen(),
      initialRoute: '/',
      routes: {
        //  '/test': (context) => const MyApp(),
        '/home': (context) => const BaseScreen(),
        '/login': (context) => const LoginScreen(),
        '/discover': (context) => const DiscoverScreen(),
        '/account': (context) => const AccountScreen(),
        '/create_image': (context) => const CreateImageScreen(),
        '/search': (context) => const SearchResultsScreen(),
        '/chats': (context) => const ChatsScreen(),
      },
    );
  }
}
