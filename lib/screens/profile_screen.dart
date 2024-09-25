import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/images_grid.dart';
import 'package:photo_app/widgets/primary_button.dart';
import 'package:photo_app/widgets/mail_title.dart';
import 'package:photo_app/widgets/main_heading.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  ProfileScreen({required this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Функция для получения данных пользователя по userId
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('userId', isEqualTo: userId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      endDrawer: EndDrawer(),
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
            icon: Icon(Icons.menu),
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder<Map<String, dynamic>?>(
                  future: getUserData(
                      widget.userId), // Получаем данные пользователя
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return Center(
                          child: Text(
                              'No user found with userId: ${widget.userId}'));
                    } else {
                      // Получаем данные пользователя
                      Map<String, dynamic> userData = snapshot.data!;
                      return Column(
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
                            child: Image.network(
                              userData['avatar'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          MainHeading(
                              textHeading:
                                  '${userData['username'].split(' ')[0]}',
                              paddingBottom: 5),
                          MainTitle(
                              textTitle: '${userData['address']}',
                              paddingBottom: 30),
                          PrimaryButton(
                            textButton:
                                'Follow ${userData['username'].split(' ')[0]}',
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
                      );
                    }
                  },
                ),
                ImagesGrid(userId: 'uRMRfzkrvy0euitnOnvM'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
