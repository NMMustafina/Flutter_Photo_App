import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/models/account_update_request.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/primary_elevated_button.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/form_field_text.dart';
import 'package:photo_app/widgets/main_snack_bar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  bool isLoading = true;
  var userData;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController avatarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMeUserData();
  }

  void fetchMeUserData() async {
    try {
      final apiService = GetIt.instance<ApiService>();
      var result = await apiService.fetchMeUserData();
      setState(() {
        userData = result;
        firstNameController.text = userData.firstName;
        lastNameController.text = userData.lastName;
        locationController.text = userData.location;
        avatarController.text = userData.avatar;
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
  void dispose() {
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    locationController.dispose();
    avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onAccountUpdate() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      final apiService = GetIt.instance<ApiService>();

      AccountUpdateRequest accountUpdateRequest = AccountUpdateRequest(
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        location: locationController.text,
        avatar: avatarController.text,
      );

      bool result = await apiService.accountUpdate(accountUpdateRequest);

      if (result) {
        Navigator.pushNamed(context, '/login');
      } else {
        MainSnackBar.showSnackBar(
          context,
          'Unknown error! Try again or contact support.',
          true,
        );
        print("Результат обновления данных пользователя: $result");
      }

      passwordController.clear();
      firstNameController.clear();
      lastNameController.clear();
      locationController.clear();
      avatarController.clear();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      endDrawer: const EndDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.black)))
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MainHeading(textHeading: 'Account'),
                        FormFieldText(
                          textHint: userData.username,
                          enabled: false,
                        ),
                        FormFieldText(
                          textHint: userData.accountName,
                          enabled: false,
                        ),
                        FormFieldText(
                          textHint: 'Enter new password',
                          toggleObscure: true,
                          textController: passwordController,
                          validator: (pass) => pass!.isEmpty || pass.length < 8
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
                          textController: avatarController,
                        ),
                        PrimaryElevatedButton(
                          textButton: 'Update',
                          onPressed: onAccountUpdate,
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
