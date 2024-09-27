import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/firebase_service.dart';
import 'package:photo_app/widgets/primary_elevated_button.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/form_field_text.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.isLogin});
  final bool isLogin;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseService firebaseService = FirebaseService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onAuth = () {
      if (widget.isLogin) {
        firebaseService.onLogin(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pushNamed(context, '/discover');
      } else {
        firebaseService.onRegister(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pushNamed(context, '/discover');
      }
    };

    final buttonText = widget.isLogin ? 'Log in' : 'Register';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(-1, 1),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/images/arrow.svg',
              width: 16,
              height: 16,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainHeading(textHeading: buttonText),
              FormFieldText(textHint: 'Email', textController: emailController),
              FormFieldText(
                  textHint: 'Password',
                  toggleObscure: true,
                  textController: passwordController),
              PrimaryElevatedButton(
                textButton: buttonText,
                onPressed: onAuth,
              ),
              widget.isLogin
                  ? SizedBox()
                  : RichText(
                      text: TextSpan(
                        text: 'By signing up, you agree to Photo’s ',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms of Service',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Обработка нажатия на текст
                              },
                          ),
                          TextSpan(
                            text: ' and ',
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Обработка нажатия на текст
                              },
                          ),
                          TextSpan(
                            text: '.',
                          ),
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
