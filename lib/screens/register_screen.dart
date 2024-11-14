import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/models/models.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController avatarController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    locationController.dispose();
    avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onRegister() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      final apiService = GetIt.instance<ApiService>();

      RegisterRequest registerRequest = RegisterRequest(
        username: emailController.text,
        password: passwordController.text,
        accountName: '@' + emailController.text.split('@')[0],
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        location: locationController.text,
        avatar: avatarController.text,
      );

      bool result = await apiService.registerUser(registerRequest);

      if (result) {
        Navigator.pushNamed(context, '/login');
      } else {
        MainSnackBar.showSnackBar(
          context,
          'Unknown error! Try again or contact support.',
          true,
        );
        print("Результат регистрации: $result");
      }

      emailController.clear();
      passwordController.clear();
      firstNameController.clear();
      lastNameController.clear();
      locationController.clear();
      avatarController.clear();
    }

    return Scaffold(
      appBar: AppBar(
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainHeading(textHeading: 'Register'),
                  FormFieldText(
                    textHint: 'Email',
                    textController: emailController,
                    validator: (email) =>
                        email!.isEmpty && !EmailValidator.validate(email)
                            ? 'Enter the correct Email address'
                            : null,
                  ),
                  FormFieldText(
                    textHint: 'Password',
                    toggleObscure: true,
                    textController: passwordController,
                    validator: (pass) => pass!.isEmpty || pass.length < 3
                        ? 'Password must be at least 8 characters'
                        : null,
                  ),
                  FormFieldText(
                    textHint: 'First Name',
                    textController: firstNameController,
                    validator: (firstName) => firstName!.isEmpty
                        ? 'Please, enter the First Name'
                        : null,
                  ),
                  FormFieldText(
                    textHint: 'Last Name',
                    textController: lastNameController,
                  ),
                  FormFieldText(
                    textHint: 'Location',
                    textController: locationController,
                  ),
                  FormFieldText(
                    textHint: 'Avatar URL',
                    textController: avatarController
                      ..text = avatarController.text.isEmpty
                          ? 'assets/images/default-avatar.webp'
                          : avatarController.text,
                  ),
                  PrimaryElevatedButton(
                    textButton: 'Register',
                    onPressed: onRegister,
                  ),
                  RichText(
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
      ),
    );
  }
}
