import 'package:praktpm_responsi/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/alertDialog_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/textField_widget.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: Center(
            child: LoginForm(),
          )
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String username = "";
  String password = "";

  late AlertDialogWidget alert;

  @override
  initState() {
    super.initState();

    loginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Text(
                "LOGIN FORM",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32,),

              TextFieldWidget(
                hintText: "Username",
                prefixIcon: Icons.person,
                obscureText: false,
                inputType: TextInputType.text,
                onChange: (value) {
                  username = value;
                }, fillColor: lightColor,
              ),
              SizedBox(height: 16,),

              TextFieldWidget(
                hintText: "Password",
                prefixIcon: Icons.lock,
                obscureText: true,
                inputType: TextInputType.text,
                onChange: (value) => {
                  password = value
                }, fillColor: lightColor,
              ),
              SizedBox(height: 16,),

              ButtonWidget(
                title: 'LOGIN',
                hasBorder: false,
                onClick: () {
                  login();
                },
              ),
              SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }

  loginStatus() async {
    SharedPreferences prefsdata = await SharedPreferences.getInstance();
    bool isLogin = prefsdata.getBool('login') ?? false;
    if(isLogin) {
      navigateToHomeScreen();
    }
  }

  login() async {
    if(username == "admin" || password == "admin") {
      SharedPreferences prefsdata = await SharedPreferences.getInstance();
      prefsdata.setBool('login', true);

      navigateToHomeScreen();

    } else {
      alert = AlertDialogWidget(
          "Login Gagal",
          "Username dan Password salah",
          "error"
      );

      alert.showAlertDialog(context);
    }
  }

  navigateToHomeScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
  }
}
