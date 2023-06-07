import 'package:flutter/material.dart';
import 'package:praktpm_responsi/screens/login_screen.dart';
import 'package:praktpm_responsi/utils/global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          theme: ThemeData(
              fontFamily: "Poppins",
              primaryColor: primaryColor,
              scaffoldBackgroundColor: primaryLightColor
          ),
          debugShowCheckedModeBanner: false,
          home: const LoginScreen(),
        )
    );
  }
}
