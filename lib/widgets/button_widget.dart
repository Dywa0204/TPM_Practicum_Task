import 'package:flutter/material.dart';

import '../utils/global.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;
  final void Function() onClick;

  const ButtonWidget({Key? key, required this.title, required this.hasBorder, required this.onClick}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onClick(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(title),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          backgroundColor: kPrimaryColor,
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}