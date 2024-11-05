import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/models/account_update_request.dart';
import 'package:photo_app/models/user_model.dart';
import 'package:photo_app/models/user_provider.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/form_field_text.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/main_snack_bar.dart';
import 'package:photo_app/widgets/primary_elevated_button.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController avatarController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Инициализируем контроллеры данными из UserProvider
    final currentUser =
        Provider.of<UserProvider>(context, listen: false).currentUser;
    if (currentUser != null) {
      firstNameController.text = currentUser.firstName;
      lastNameController.text =
          (currentUser.lastName?.isEmpty ?? true ? '' : currentUser.lastName)!;
      locationController.text =
          (currentUser.location?.isEmpty ?? true ? '' : currentUser.location)!;
      avatarController.text =
          (currentUser.avatar?.isEmpty ?? true ? '' : currentUser.avatar)!;
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

      final userProvider = Provider.of<UserProvider>(context, listen: false);
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
        // Обновляем данные пользователя в провайдере
        UserModel user = await apiService.fetchCurrentUserData();
        userProvider.setUser(user);

        MainSnackBar.showSnackBar(
            context, 'Profile updated successfully!', false);
      } else {
        MainSnackBar.showSnackBar(
          context,
          'Unknown error! Try again or contact support.',
          true,
        );
      }

      passwordController.clear();
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
            child: Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                final currentUser = userProvider.currentUser;
                return Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MainHeading(textHeading: 'Account'),
                      FormFieldText(
                        textHint: currentUser?.username ?? '',
                        enabled: false,
                      ),
                      FormFieldText(
                        textHint: currentUser?.accountName ?? '',
                        enabled: false,
                      ),
                      FormFieldText(
                        textHint: 'Enter new password',
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
                        textController: avatarController,
                      ),
                      PrimaryElevatedButton(
                        textButton: 'Update',
                        onPressed: onAccountUpdate,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
