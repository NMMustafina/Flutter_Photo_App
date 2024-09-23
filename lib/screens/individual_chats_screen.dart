import 'package:flutter/material.dart';
import 'package:photo_app/widgets/individual_chats_recipient.dart';
import 'package:photo_app/widgets/individual_chats_sender.dart';
import 'package:photo_app/widgets/mail_title.dart';

class IndividualChatsScreen extends StatefulWidget {
  const IndividualChatsScreen({Key? key}) : super(key: key);

  @override
  _IndividualChatsScreenState createState() => _IndividualChatsScreenState();
}

class _IndividualChatsScreenState extends State<IndividualChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: MainTitle(textTitle: 'James', paddingBottom: 0),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  height: 1,
                  color: Color(0x4C000000),
                ),
                IndividualChatsSender(
                  pathAvatar: 'assets/images/avatar/avatar_08.png',
                  textMessage:
                      'Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!',
                ),
                IndividualChatsRecipient(
                  pathAvatar: 'assets/images/avatar/avatar_07.png',
                  textMessage:
                      'A fast 50mm like f1.8 would help with the bokeh. I’ve been using primes as they tend to get a bit sharper images.',
                ),
                IndividualChatsSender(
                    pathAvatar: 'assets/images/avatar/avatar_08.png',
                    textMessage: 'Thank you! That was very helpful!'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
