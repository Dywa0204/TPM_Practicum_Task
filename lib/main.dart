import 'package:final_project/pages/map_page.dart';
import 'package:final_project/screens/splash_screen.dart';
import 'package:final_project/utils/boxes.dart';
import 'package:final_project/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'data/models/user.dart';

void main() async {
  Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox<User>(HiveBoxex.user);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
