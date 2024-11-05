import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/bottom_nav_bar.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/images_grid.dart';
import 'package:photo_app/widgets/primary_elevated_button.dart';
import 'package:photo_app/widgets/main_title.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/primary_outlined_button.dart';

class ProfileScreen extends StatefulWidget {
  final String accountName;

  const ProfileScreen({super.key, required this.accountName});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  var userData;

  @override
  void initState() {
    super.initState();
    fetchUserDataByAccountName(widget.accountName);
  }

  void fetchUserDataByAccountName(accountName) async {
    try {
      final apiService = GetIt.instance<ApiService>();
      var result = await apiService.fetchUserDataByAccountName(accountName);
      setState(() {
        userData = result;
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            width: 128,
                            height: 128,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: userData.avatar != null
                                ? Image.network(
                                    userData.avatar,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/default-avatar.webp',
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  )
                                : Image.asset(
                                    'assets/images/default-avatar.webp',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          MainHeading(
                            textHeading: userData.firstName +
                                (userData.lastName != null
                                    ? ' ' + userData.lastName
                                    : ''),
                            paddingBottom: 5,
                          ),
                          userData.location != null &&
                                  userData.location.isNotEmpty
                              ? MainTitle(
                                  textTitle: userData.location,
                                  paddingBottom: 30)
                              : const SizedBox.shrink(),
                          PrimaryElevatedButton(
                            textButton: 'Follow ${userData.firstName}',
                            onPressed: () {
                              Navigator.pushNamed(context, '/profile');
                            },
                          ),
                          PrimaryOutlinedButton(
                            textButton: 'Message',
                            paddingBottom: 30,
                            onPressed: () {
                              Navigator.pushNamed(context, '/chats');
                            },
                          ),
                        ],
                      ),
                      //const ImagesGrid(userId: "widget.userId"),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 4,
      ),
    );
  }
}
