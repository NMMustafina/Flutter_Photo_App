import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/widgets/end_drawer.dart';
import 'package:photo_app/widgets/mail_title.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/form_field_text.dart';
import 'package:photo_app/widgets/images_load_more_grid.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResultsScreen> {
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
                padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeading(textHeading: 'Search'),
                    FormFieldText(textHint: 'dogs'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTitle(textTitle: 'All Results'),
                    ImagesLoadMoreGrid(),
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
