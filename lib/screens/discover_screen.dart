import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/models/image_model.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/bottom_nav_bar.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/images_masonry_grid.dart';
import 'package:photo_app/widgets/images_list.dart';
import 'package:photo_app/widgets/main_title.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/primary_outlined_button.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  late List<ImageModel> imagesData = [];
  late int imageDataPage = 0;

  late List<ImageModel> allImages = [];
  late int allImagesPage = 0;
  late bool allImagesLastPage = false;
  final apiService = GetIt.instance<ApiService>();

  @override
  void initState() {
    super.initState();
    fetchImagesByTag('whats-new');
    fetchAllImages();
  }

  void fetchImagesByTag(tag) async {
    try {
      int size = 4;
      var result = await apiService.fetchImagesByTag(tag, imageDataPage, size);
      setState(() {
        imagesData.addAll(result.content);
        imageDataPage = result.number;
        isLoading = false;
      });
    } catch (e) {
      print("Ошибка: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void fetchAllImages() async {
    try {
      int size = 10;
      var result = await apiService.fetchImagesData(
          allImagesPage, size, "createdAt", false);
      setState(() {
        allImages.addAll(result.content);
        allImagesPage = result.number;
        allImagesLastPage = result.last;
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
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainHeading(textHeading: 'Discover'),
                          MainTitle(textTitle: 'What\'s new today'),
                        ],
                      ),
                    ),
                    ImagesList(imagesData: imagesData),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MainTitle(textTitle: 'Browse all'),
                          ImagesMasonryGrid(imagesData: allImages),
                          PrimaryOutlinedButton(
                            textButton: 'See More',
                            onPressed: allImagesLastPage
                                ? null // Если условие истинно, кнопка отключается
                                : () {
                                    allImagesPage += 1;
                                    fetchAllImages();
                                  },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 0,
      ),
    );
  }
}
