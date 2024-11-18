import 'package:photo_app/screens/screens.dart';

final routes = {
//  '/test': (context) => const MyApp(),
  '/': (context) => const BaseScreen(),
  '/home': (context) => const BaseScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/discover': (context) => const DiscoverScreen(),
  '/account': (context) => const AccountScreen(),
  '/create_image': (context) => const CreateImageScreen(),
  '/search': (context) => const SearchScreen(),
  '/chats': (context) => const ChatsScreen(),
};
