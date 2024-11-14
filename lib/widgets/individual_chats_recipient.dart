import 'package:flutter/material.dart';
import 'package:photo_app/theme/styling.dart';

class IndividualChatsRecipient extends StatelessWidget {
  final String avatar;
  final String textMessage;

  const IndividualChatsRecipient({
    super.key,
    required this.avatar,
    required this.textMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0x07000000),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: Text(
                        textMessage,
                        style: b13Regular,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 28,
                height: 28,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  avatar,
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
