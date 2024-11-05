import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/bottom_nav_bar.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/image_card.dart';
import 'package:photo_app/widgets/images_grid.dart';
import 'package:photo_app/services/images_info.dart';
import 'package:photo_app/widgets/main_title.dart';
import 'package:photo_app/widgets/main_heading.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  var imagesData;

  @override
  void initState() {
    super.initState();
    fetchImagesData();
  }

  void fetchImagesData() async {
    try {
      final apiService = GetIt.instance<ApiService>();
      var result = await apiService.fetchImagesData();
      setState(() {
        imagesData = result;
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 37),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 400,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 16),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: imagesData.length,
                          itemBuilder: (context, index) {
                            return ImageCard(
                              imageLink: imagesData[index].imageLink,
                              avatar: imagesData[index].user.avatar,
                              fullName: imagesData[index].user.firstName +
                                  (imagesData[index].user.lastName != null
                                      ? ' ' + imagesData[index].user.lastName
                                      : ''),
                              accountName: imagesData[index].user.accountName,
                            );
                          },
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainTitle(textTitle: 'Browse all'),
                          ImagesGrid(
                            category: 'browse-all',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
      ),
    );
  }
}
