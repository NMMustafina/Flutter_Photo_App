import 'package:flutter/material.dart';

class FormFieldBlack extends StatefulWidget {
  // Переменная, которую мы передаем через конструктор
  final String textHint;
  final bool toggleObscure;

  // Конструктор для передачи переменной
  FormFieldBlack({required this.textHint, this.toggleObscure = false});

  @override
  _FormFieldBlackState createState() => _FormFieldBlackState();
}

class _FormFieldBlackState extends State<FormFieldBlack> {
  late String _textHint;
  late bool _toggleObscure;

  @override
  void initState() {
    super.initState();
    // Инициализируем локальную переменную значением, переданным в виджет
    _textHint = widget.textHint;
    _toggleObscure = widget.toggleObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: TextFormField(
        autofocus: true,
        obscureText: _toggleObscure,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            letterSpacing: 0.0,
          ),
          hintText: _textHint,
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
