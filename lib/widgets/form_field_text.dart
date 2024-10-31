import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldText extends StatefulWidget {
  final String textHint;
  final bool toggleObscure;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textController;
  final bool enabled;

  const FormFieldText({
    Key? key,
    required this.textHint,
    this.toggleObscure = false,
    this.validator,
    this.textController,
    this.enabled = true,
  }) : super(key: key);

  @override
  _FormFieldTextState createState() => _FormFieldTextState();
}

class _FormFieldTextState extends State<FormFieldText> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.toggleObscure; // начальная установка в зависимости от параметра
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: widget.textController,
        obscureText: _isObscured,
        validator: widget.validator,
        enabled: widget.enabled,
        autofocus: true,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
          hintText: widget.textHint,
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
          // Добавляем иконку глаза
          suffixIcon: widget.toggleObscure
              ? IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured; // Переключаем видимость текста
              });
            },
          )
              : null,
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
