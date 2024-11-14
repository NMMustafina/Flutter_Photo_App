import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/models/image_model.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/theme/styling.dart';
import 'package:photo_app/widgets/bottom_nav_bar.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/images_grid.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/form_field_text.dart';
import 'package:photo_app/widgets/main_title.dart';
import 'package:photo_app/widgets/primary_elevated_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  late List<ImageModel> imagesData = [];
  late int imageDataPage = 0;
  late bool imageDataLastPage = false;

  final apiService = GetIt.instance<ApiService>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController tagsController = TextEditingController();

  void fetchImagesByTag(tag) async {
    try {
      int size = 2;
      imageDataPage = 0;
      var result = await apiService.fetchImagesByTag(tag, imageDataPage, size);
      setState(() {
        imagesData = result.content;
        imageDataPage = result.number;
        imageDataLastPage = result.last;
        isLoading = false;
      });
    } catch (e) {
      print("Ошибка: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void fetchNextPage(tag) async {
    try {
      int size = 2;
      var result = await apiService.fetchImagesByTag(tag, imageDataPage, size);
      setState(() {
        imagesData.addAll(result.content);
        imageDataPage = result.number;
        imageDataLastPage = result.last;
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
    tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const EndDrawer(),
      appBar: AppBar(
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
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MainHeading(textHeading: 'Search'),
                    FormFieldText(
                      textHint: 'e.g. dog',
                      textController: tagsController,
                    ),
                    PrimaryElevatedButton(
                      textButton: 'Search',
                      onPressed: () {
                        fetchImagesByTag(tagsController.text);
                      },
                    ),
                  ],
                ),
              ),
              isLoading && imagesData.isEmpty
                  ? const SizedBox
                      .shrink() // Ничего не отображаем при первой загрузке
                  : isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.black),
                          ),
                        )
                      : imagesData.isEmpty
                          ? Center(
                              child: Text(
                                'No results found.',
                                style: b16Regular.copyWith(color: Colors.grey),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 0, 16, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MainTitle(textTitle: 'All Results'),
                                  ImagesGrid(
                                      imagesData: imagesData,
                                      imageDataLastPage: imageDataLastPage,
                                      onEndReached: () {
                                        imageDataPage += 1;
                                        fetchNextPage(tagsController.text);
                                      }),
                                ],
                              ),
                            ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 1,
      ),
    );
  }
}
