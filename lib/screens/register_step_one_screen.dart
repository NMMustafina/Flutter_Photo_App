import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_app/widgets/button_black.dart';
import 'package:photo_app/widgets/main_heading.dart';
import 'package:photo_app/widgets/form_field_black.dart';
import 'package:photo_app/screens/register_step_two_screen.dart';

class RegisterStepOneScreen extends StatefulWidget {
  const RegisterStepOneScreen({Key? key}) : super(key: key);

  @override
  _RegisterStepOneScreenState createState() => _RegisterStepOneScreenState();
}

class _RegisterStepOneScreenState extends State<RegisterStepOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(-1, 1),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/images/arrow.svg',
              width: 16,
              height: 16,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainHeading(textHeading: 'Register'),
              FormFieldBlack(textHint: 'Email'),
              FormFieldBlack(textHint: 'Password', toggleObscure: true),
              ButtonBlack(
                textButton: "Next",
                Url: const RegisterStepTwoScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
