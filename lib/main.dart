import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:photo_app/firebase_options.dart';
import 'package:photo_app/screens/base_screen.dart';
import 'package:photo_app/screens/chats_screen.dart';
import 'package:photo_app/screens/discover_screen.dart';
import 'package:photo_app/screens/profile_screen.dart';
import 'package:photo_app/screens/search_results_screen.dart';
import 'package:photo_app/screens/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const PhotoApp());
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
        '/test': (context) =>  MyHomePage(),
        '/home': (context) => const BaseScreen(),
        '/discover': (context) => const DiscoverScreen(),
        '/profile': (context) => ProfileScreen(userId: 'uRMRfzkrvy0euitnOnvM'),
        '/search': (context) => const SearchResultsScreen(),
        '/chats': (context) => const ChatsScreen(),
      },
    );
  }
}
