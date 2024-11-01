import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/models/auth_request.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/primary_elevated_button.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/form_field_text.dart';
import 'package:photo_app/widgets/main_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    onLogin() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      final apiService = GetIt.instance<ApiService>();

      AuthRequest authRequest = AuthRequest(
        username: emailController.text,
        password: passwordController.text,
      );

     // print('${authRequest.username} ${authRequest.password}');

      bool result = await apiService.loginUser(authRequest);

      if (result) {
        Navigator.pushNamed(context, '/discover');
      } else {
        MainSnackBar.showSnackBar(
          context,
          'Unknown error! Try again or contact support.',
          true,
        );
        print("Результат авторизации: $result");
      }
    }

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainHeading(textHeading: 'Login'),
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
                    validator: (pass) => pass!.isEmpty && pass.length < 8
                        ? 'Password must be at least 8 characters'
                        : null,
                  ),
                  PrimaryElevatedButton(
                    textButton: 'Log in',
                    onPressed: onLogin,
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
