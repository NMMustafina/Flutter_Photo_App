import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/models/models.dart';
import 'package:photo_app/screens/screens.dart';
import 'package:photo_app/services/api_service.dart';
import 'package:photo_app/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  final String accountName;

  const ProfileScreen({super.key, required this.accountName});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  late UserModel userData;

  late List<ImageModel> imagesData = [];
  late int imageDataPage = 0;
  late bool imageDataLastPage = false;

  final apiService = GetIt.instance<ApiService>();

  @override
  void initState() {
    super.initState();
    fetchUserDataByAccountName(widget.accountName);
    fetchImagesByAccountName(widget.accountName);
  }

  void fetchUserDataByAccountName(accountName) async {
    try {
      var result = await apiService.fetchUserDataByAccountName(accountName);
      setState(() {
        userData = result;
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Ошибка: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void fetchImagesByAccountName(accountName) async {
    try {
      int size = 4;
      var result = await apiService.fetchImagesByAccountName(
          accountName, imageDataPage, size);
      setState(() {
        imagesData.addAll(result.content);
        imageDataPage = result.number;
        imageDataLastPage = result.last;
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Ошибка: $e");
      setState(() {
        isLoading = false;
      });
    }
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
                            child: userData.avatar != null &&
                                    userData.avatar!.isNotEmpty
                                ? Image.network(
                                    userData.avatar!,
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
                            textHeading:
                                userData.firstName + (userData.lastName ?? ''),
                            paddingBottom: 5,
                          ),
                          userData.location != null &&
                                  userData.location!.isNotEmpty
                              ? MainTitle(
                                  textTitle: userData.location!,
                                  paddingBottom: 30,
                                )
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateMessageScreen(userId: userData.id),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      ImagesMasonryGrid(
                          imagesData: imagesData,
                          imageDataLastPage: imageDataLastPage,
                          onEndReached: () {
                            imageDataPage += 1;
                            fetchImagesByAccountName(widget.accountName);
                          }),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 4,
      ),
    );
  }
}
