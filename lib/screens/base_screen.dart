import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/screens/login_screen.dart';
import 'package:photo_app/screens/profile_screen.dart';
import 'package:photo_app/screens/register_step_one_screen.dart';
import 'package:photo_app/widgets/user_info.dart';
import 'package:photo_app/widgets/button_white.dart';
import 'package:photo_app/widgets/button_black.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key, required this.title});
  final String title;

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/home/bg.png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/home/logo.svg',
                              width: 38,
                              height: 38,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Text(
                                'photo',
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontSize: 48,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      UserInfo(
                        pathAvatar: 'assets/images/avatar/avatar_01.png',
                        textUsername: 'Pawel Czerwinski',
                        textLogin: '@pawel_czerwinski',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ButtonWhite(
                      textButton: "Log in",
                      Url: const ProfileScreen(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ButtonBlack(
                      textButton: "Register",
                      Url: const RegisterStepOneScreen(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
