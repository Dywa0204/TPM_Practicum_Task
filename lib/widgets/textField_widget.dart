import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onTap;
  final bool obscureText;
  final TextInputType inputType;
  final Color fillColor;
  final void Function(String value) onChange;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    required this.onChange,
    required this.inputType,
    required this.fillColor,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: obscureText,
      onChanged: (value) => onChange(value),
      onTap: onTap,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 16
      ),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: (prefixIcon != null) ? Icon(
          prefixIcon,
          size: 18,
          color: Theme.of(context).primaryColor,
        ) : null,
        filled: true,
        fillColor: fillColor,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Theme.of(context).primaryColor)
        ),
        suffixIcon: (suffixIcon != null) ? Icon(
          suffixIcon,
          size: 18,
          color: Theme.of(context).primaryColor,
        ) : null,
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
        focusColor: Theme.of(context).primaryColor
      ),
    );
  }
}
