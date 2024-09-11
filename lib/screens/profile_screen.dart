import 'package:flutter/material.dart';
import 'package:photo_app/screens/chats_screen.dart';
import 'package:photo_app/widgets/button_black.dart';
import 'package:photo_app/widgets/button_white.dart';
import 'package:photo_app/widgets/images_grid_profile.dart';
import 'package:photo_app/widgets/mail_title.dart';
import 'package:photo_app/widgets/main_heading.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      width: 128,
                      height: 128,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/avatar/avatar_07.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    MainHeading(textHeading: 'Jane', paddingBottom: 5),
                    MainTitle(textTitle: 'San Francisco, CA', paddingBottom: 30),
                    ButtonBlack(textButton: 'Follow Jane', Url: ProfileScreen()),
                    ButtonWhite(textButton: 'Message', Url: ChatsScreen(), paddingBottom: 30),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImagesGridProfile(),
                    ButtonWhite(
                        textButton: 'See More',
                        Url: ProfileScreen()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
