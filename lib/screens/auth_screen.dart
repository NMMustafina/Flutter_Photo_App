import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:photo_app/firebase_service.dart';
import 'package:photo_app/widgets/primary_elevated_button.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/form_field_text.dart';
import 'package:photo_app/widgets/main_snack_bar.dart';

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
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onAuth() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      try {
        if (widget.isLogin) {
          await firebaseService.onLogin(
            email: emailController.text,
            password: passwordController.text,
          );
          Navigator.pushNamed(context, '/discover');
        } else {
          await firebaseService.onRegister(
            email: emailController.text,
            password: passwordController.text,
          );
          Navigator.pushNamed(context, '/discover');
        }
      } on FirebaseAuthException catch (e) {
        print(e.code);

        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          MainSnackBar.showSnackBar(
            context,
            'Incorrect email or password. Please try again',
            true,
          );
          return;
        } else {
          MainSnackBar.showSnackBar(
            context,
            'Unknown error! Try again or contact support.',
            true,
          );
          return;
        }
      }
    }

    final buttonText = widget.isLogin ? 'Log in' : 'Register';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: const AlignmentDirectional(-1, 1),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/images/icons/arrow.svg',
              width: 16,
              height: 16,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainHeading(textHeading: buttonText),
                FormFieldText(
                  textHint: 'Email',
                  textController: emailController,
                  validator: (email) =>
                      email.isEmpty && !EmailValidator.validate(email)
                          ? 'Enter the correct Email address'
                          : null,
                ),
                FormFieldText(
                  textHint: 'Password',
                  toggleObscure: true,
                  textController: passwordController,
                  validator: (pass) => pass.isEmpty && pass.length < 8
                      ? 'Password must be at least 8 characters'
                      : null,
                ),
                PrimaryElevatedButton(
                  textButton: buttonText,
                  onPressed: onAuth,
                ),
                widget.isLogin
                    ? const SizedBox()
                    : RichText(
                        text: TextSpan(
                          text: 'By signing up, you agree to Photo’s ',
                          style: const TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Service',
                              style: const TextStyle(
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Обработка нажатия на текст
                                },
                            ),
                            const TextSpan(
                              text: ' and ',
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: const TextStyle(
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Обработка нажатия на текст
                                },
                            ),
                            const TextSpan(
                              text: '.',
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
