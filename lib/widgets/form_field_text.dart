import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldText extends StatelessWidget {
  final String textHint;
  final bool toggleObscure;
  final FormFieldValidator? validator;
  final TextEditingController? textController;

  const FormFieldText(
      {super.key,
      required this.textHint,
      this.toggleObscure = false,
      this.validator,
      this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: textController,
        obscureText: toggleObscure,
        validator: validator,
        autofocus: true,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
          hintText: textHint,
          hintStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFB3261E),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFB3261E),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16),
        ),
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 15,
        ),
        maxLines: 1,
        inputFormatters: [LengthLimitingTextInputFormatter(50)],
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
      ),
    );
  }
}
