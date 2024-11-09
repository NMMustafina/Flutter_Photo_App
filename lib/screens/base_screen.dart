import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/models/image_model.dart';
import 'package:photo_app/screens/login_screen.dart';
import 'package:photo_app/screens/register_screen.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/primary_outlined_button.dart';
import 'package:photo_app/widgets/primary_elevated_button.dart';
import 'package:photo_app/widgets/user_info.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  bool isLoading = true;
  late ImageModel imagesData;
  final apiService = GetIt.instance<ApiService>();

  @override
  void initState() {
    super.initState();
    fetchRandomImages();
  }

  void fetchRandomImages() async {
    try {
      var result = await apiService.fetchRandomImages();
      setState(() {
        imagesData = result;
        isLoading = false;
      });
    } catch (e) {
      print("Ошибка: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black)))
          : Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                    imagesData.imageLink,
                  ).image,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
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
                              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
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
                        avatar: imagesData.user.avatar ??
                            'assets/images/default-avatar.webp',
                        fullName:
                        '${imagesData.user.firstName} ${imagesData.user.lastName ?? ''}',
                        accountName: imagesData.user.accountName,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: PrimaryOutlinedButton(
                    textButton: "Log in",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PrimaryElevatedButton(
                    textButton: "Register",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
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
