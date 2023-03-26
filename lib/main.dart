import 'package:flutter/material.dart';
import 'package:praktpm_tugas2/screens/splash_screen.dart';
import 'utils/global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: "Poppins",
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kPrimaryLightColor
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        )
    );
  }
}
