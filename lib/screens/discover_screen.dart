import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/services/images_info.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/image_card.dart';
import 'package:photo_app/widgets/images_grid.dart';
import 'package:photo_app/widgets/mail_title.dart';
import 'package:photo_app/widgets/main_heading.dart';

class DiscoverScreen extends StatefulWidget {
  final String? userId;
  final String? category;

  const DiscoverScreen({super.key, this.userId, this.category = 'whats-new'});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            'assets/images/arrow.svg',
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
                  child:
                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: getImagesWithUserInfo(
                            widget.userId, widget.category),
                        builder: (context,
                            AsyncSnapshot<List<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (snapshot.hasError) {
                            return Center(
                                child: Text('Ошибка: ${snapshot.error}'));
                          }

                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(child: Text('Нет изображений'));
                          }

                          final imageData = snapshot.data!;

                          return ListView.builder(
                            padding: const EdgeInsets.only(left: 16),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: imageData.length,
                            itemBuilder: (context, index) {
                              return ImageCard(
                                pathImageCard: imageData[index]['imageLink'],
                                pathAvatar: imageData[index]['avatar'],
                                textUsername: imageData[index]['username'],
                                textLogin: imageData[index]['login'],
                              );
                            },
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
    );
  }
}
