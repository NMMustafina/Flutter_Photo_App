import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/screens/individual_chats_screen.dart';
import 'package:photo_app/widgets/bottom_nav_bar.dart';
import 'package:photo_app/widgets/chats_item.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/main_title.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const EndDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/images/icons/arrow.svg',
            width: 16,
            height: 16,
            fit: BoxFit.cover,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      body: const SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                MainTitle(textTitle: 'Chats'),
                Divider(
                  height: 1,
                  color: Color(0x4C000000),
                ),
                ChatsItem(
                    avatar: 'assets/images/avatar/avatar_08.png',
                    textUsername: 'James',
                    textMessage: 'Thank you! That was very helpful!',
                    textUrl: IndividualChatsScreen()),
                ChatsItem(
                    avatar: 'assets/images/avatar/avatar_09.png',
                    textUsername: 'Will Kenny',
                    textMessage: 'I know... I’m trying to get the funds.',
                    textUrl: IndividualChatsScreen()),
                ChatsItem(
                    avatar: 'assets/images/avatar/avatar_10.png',
                    textUsername: 'Beth Williams',
                    textMessage:
                        'I’m looking for tips around capturing the milky way. I have a 6D with a 24-100mm...',
                    textUrl: IndividualChatsScreen()),
                ChatsItem(
                    avatar: 'assets/images/avatar/avatar_11.png',
                    textUsername: 'Rev Shawn',
                    textMessage:
                        'Wanted to ask if you’re available for a portrait shoot next week.',
                    textUrl: IndividualChatsScreen()),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 3,
      ),
    );
  }
}
