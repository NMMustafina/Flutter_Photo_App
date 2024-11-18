import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/models/models.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/widgets.dart';

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
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    onLogin() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      final apiService = GetIt.instance<ApiService>();

      AuthRequest authRequest = AuthRequest(
        username: emailController.text,
        password: passwordController.text,
      );

      bool result = await apiService.loginUser(authRequest);

      if (result) {
        UserModel currentUser = await apiService.fetchCurrentUserData();
        userProvider.setUser(currentUser);

        Navigator.pushNamed(context, '/discover');
      } else {
        MainSnackBar.showSnackBar(
          context,
          'Unknown error! Try again or contact support.',
          true,
        );
        debugPrint("Результат авторизации: $result");
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: const AlignmentDirectional(-1, 1),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
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
