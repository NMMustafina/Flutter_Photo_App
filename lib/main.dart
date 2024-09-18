import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:photo_app/firebase_options.dart';
import 'package:photo_app/screens/base_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo App',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const BaseScreen(title: 'Photo App'),
    );
  }
}
