import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/screens/auth_screen.dart';
import 'package:photo_app/services/images_info.dart';
import 'package:photo_app/widgets/user_info.dart';
import 'package:photo_app/widgets/primary_button.dart';

class BaseScreen extends StatelessWidget {
  final String? userId;
  final String? category;

  const BaseScreen(
      {super.key, this.userId = 'oAzP8riZHp8uojHiWPQQ', this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: getImagesWithUserInfo(userId, category),
              builder: (context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Ошибка: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Нет изображений'));
                }

                final imageData = snapshot.data![0];

                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        imageData['imageLink'],
                      ).image,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
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
                              const Padding(
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
                          pathAvatar: imageData['avatar'],
                          textUsername: imageData['username'],
                          textLogin: imageData['login'],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: PrimaryButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    textButton: "Log in",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(isLogin: true),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton(
                    textButton: "Register",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AuthScreen(isLogin: false),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
