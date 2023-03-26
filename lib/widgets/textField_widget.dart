import 'package:praktpm_tugas2/utils/global.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final void Function(String value) onChange;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    required this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: (value) => onChange(value),
      style: TextStyle(
        color: kPrimaryColor,
        fontSize: 16
      ),
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          size: 18,
          color: kPrimaryColor,
        ),
        filled: true,
        fillColor: kPrimaryLightColor,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kPrimaryColor)
        ),
        suffixIcon: Icon(
          suffixIcon,
          size: 18,
          color: kPrimaryColor,
        ),
        labelStyle: TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor
      ),
    );
  }
}
