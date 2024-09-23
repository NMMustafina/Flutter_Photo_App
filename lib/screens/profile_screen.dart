import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/screens/chats_screen.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/primary_button.dart';
import 'package:photo_app/widgets/images_grid_profile.dart';
import 'package:photo_app/widgets/mail_title.dart';
import 'package:photo_app/widgets/main_heading.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      width: 128,
                      height: 128,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/avatar/avatar_07.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    MainHeading(textHeading: 'Jane', paddingBottom: 5),
                    MainTitle(textTitle: 'San Francisco, CA', paddingBottom: 30),
                    PrimaryButton(
                      textButton: 'Follow Jane',
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                    PrimaryButton(
                      textButton: 'Message',
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      paddingBottom: 30,
                      onPressed: () {
                        Navigator.pushNamed(context, '/chats');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImagesGridProfile(),
                    PrimaryButton(
                      textButton: 'See More',
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatsScreen(),
                          ),
                        );
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
