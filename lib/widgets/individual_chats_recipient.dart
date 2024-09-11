import 'package:flutter/material.dart';

class IndividualChatsRecipient extends StatelessWidget {
  final String pathAvatar;
  final String textMessage;

  const IndividualChatsRecipient({
    Key? key,
    required this.pathAvatar,
    required this.textMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x07000000),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Text(
                        textMessage,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 28,
                height: 28,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  pathAvatar,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
