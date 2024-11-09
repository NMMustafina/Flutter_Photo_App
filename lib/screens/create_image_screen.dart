import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/models/create_image_request.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/bottom_nav_bar.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/primary_elevated_button.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/form_field_text.dart';
import 'package:photo_app/widgets/main_snack_bar.dart';

class CreateImageScreen extends StatefulWidget {
  const CreateImageScreen({super.key});

  @override
  State<CreateImageScreen> createState() => _CreateImageScreenState();
}

class _CreateImageScreenState extends State<CreateImageScreen> {
  final TextEditingController imageLinkController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    imageLinkController.dispose();
    tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onCreateImage() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      final apiService = GetIt.instance<ApiService>();

      // Преобразование строки тегов в список
      List<String> tags =
          tagsController.text.split(',').map((tag) => tag.trim()).toList();

      CreateImageRequest createImageRequest = CreateImageRequest(
        imageLink: imageLinkController.text,
        tags: tags,
      );

      bool result = await apiService.createImage(createImageRequest);

      if (result) {
        Navigator.pushNamed(context, '/discover');
      } else {
        MainSnackBar.showSnackBar(
          context,
          'Unknown error! Try again or contact support.',
          true,
        );
        print("Результат создания нового изображения: $result");
      }

      imageLinkController.clear();
      tagsController.clear();
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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainHeading(textHeading: 'Create Image'),
                  FormFieldText(
                    textHint: 'Image Link',
                    textController: imageLinkController,
                    validator: (imageLink) => imageLink!.isEmpty
                        ? 'Enter the correct image link'
                        : null,
                  ),
                  FormFieldText(
                    textHint: 'Enter tags separated by commas',
                    textController: tagsController,
                  ),
                  PrimaryElevatedButton(
                    textButton: 'Create Image',
                    onPressed: onCreateImage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 2,
      ),
    );
  }
}
