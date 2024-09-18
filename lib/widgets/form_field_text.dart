import 'package:flutter/material.dart';

class FormFieldText extends StatelessWidget {
  final String textHint;
  final bool toggleObscure;
  final TextEditingController? controller;

  FormFieldText({required this.textHint, this.toggleObscure = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: TextFormField(
        controller: controller,
        //autofocus: true,
        obscureText: toggleObscure,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            letterSpacing: 0.0,
          ),
          hintText: textHint,
          hintStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            letterSpacing: 0.0,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        ),
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 15,
          letterSpacing: 0.0,
        ),
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
      ),
    );
  }
}
