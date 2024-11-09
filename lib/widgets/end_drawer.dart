import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:photo_app/widgets/end_drawer_primary_button.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void logout(BuildContext context) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (route) => false,
      );
    }

    return Drawer(
      backgroundColor: Colors.white,
      elevation: 16,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black, size: 24),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 30),
            const EndDrawerPrimaryButton(title: 'Discover', routeName: '/discover'),
            const SizedBox(height: 10),
            const EndDrawerPrimaryButton(title: 'Search', routeName: '/search'),
            const SizedBox(height: 10),
            const EndDrawerPrimaryButton(title: 'Chats', routeName: '/chats'),
            const SizedBox(height: 10),
            const EndDrawerPrimaryButton(title: 'Account', routeName: '/account'),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF00D6),
                    Color(0xFFFF4D00),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: ElevatedButton(
                onPressed: () => logout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                child: const Text(
                  'Log out',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
