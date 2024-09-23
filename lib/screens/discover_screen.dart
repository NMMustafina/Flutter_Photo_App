import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/image_card.dart';
import 'package:photo_app/widgets/images_grid.dart';
import 'package:photo_app/widgets/mail_title.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/primary_button.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

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
      endDrawer: EndDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:
        IconButton(
          icon: SvgPicture.asset('assets/images/arrow.svg',
              width: 16,
              height: 16,
              fit: BoxFit.cover,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
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
                padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeading(textHeading: 'Discover'),
                    MainTitle(textTitle: 'What\'s new today'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 37),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 16),
                        ImageCard(
                          pathImageCard: 'assets/images/whats_new/image_01.png',
                          pathAvatar: 'assets/images/avatar/avatar_02.png',
                          textUsername: 'Ridhwan Nordin',
                          textLogin: '@ridzjcob',
                        ),
                        ImageCard(
                          pathImageCard: 'assets/images/whats_new/image_02.png',
                          pathAvatar: 'assets/images/avatar/avatar_03.png',
                          textUsername: 'Clem Onojeghuo',
                          textLogin: '@clemono2',
                        ),
                        ImageCard(
                          pathImageCard: 'assets/images/whats_new/image_03.png',
                          pathAvatar: 'assets/images/avatar/avatar_04.png',
                          textUsername: 'Jon Tyson',
                          textLogin: '@jontyson',
                        ),
                        ImageCard(
                          pathImageCard: 'assets/images/whats_new/image_04.png',
                          pathAvatar: 'assets/images/avatar/avatar_05.png',
                          textUsername: 'Simon Zhu',
                          textLogin: '@smnzhu',
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTitle(textTitle: 'Browse all'),
                    ImagesGrid(),
                    PrimaryButton(
                      textButton: 'See More',
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      onPressed: () {
                        Navigator.pushNamed(context, '/search');
                      },
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
