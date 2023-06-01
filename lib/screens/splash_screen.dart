import 'package:final_project/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: (3)),
      vsync: this,
    );
  }

  _getPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      } else {
        _checkLoginStatus();
      }
    } else {
      _checkLoginStatus();
    }
  }

  _checkLoginStatus() async {
    SharedPreferences prefsdata = await SharedPreferences.getInstance();

    bool isLogin = prefsdata.getBool('login') ?? false;

    if(isLogin) {
      _openHomeScreen();
    } else {
      _openLoginScreen();
    }
  }

  _openLoginScreen() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  _openHomeScreen() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset(
            'assets/lottie/loading.json',
            controller: _controller,
            height: MediaQuery.of(context).size.width * 0.8,
            animate: true,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().whenComplete(() {
                  _getPermission();
                });
            },
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "Genting App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),
                ),
                SizedBox(height: 32,),
                Text("Kamila & Dywa"),
                Text("031 & 041")
              ],
            ),
          )
        ],
      ),
    );
  }
}

