import 'package:lottie/lottie.dart';
import 'package:praktpm_tugas2/screens/home_screen.dart';
import 'package:praktpm_tugas2/widgets/alertDialog_widget.dart';
import 'package:praktpm_tugas2/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/textField_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: AnimatedContainer(
            curve: Curves.easeInOutQuad,
            duration: Duration(milliseconds: 275),
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + MediaQuery.of(context).padding.bottom),
            child: SafeArea(
              bottom: false,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(child: Center(
                          child: Lottie.asset(
                            'assets/lottie/road-trip.json',
                            animate: true,
                          ),
                        )),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: LoginForm(),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
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
                "MoTour Lite",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 32,),
              new TextFieldWidget(
                hintText: "Username",
                prefixIcon: Icons.person,
                obscureText: false,
                onChange: (value) {
                  username = value;
                },
              ),
              SizedBox(height: 16,),
              new TextFieldWidget(
                hintText: "Password",
                prefixIcon: Icons.lock,
                obscureText: true,
                onChange: (value) => {
                  password = value
                },
              ),
              SizedBox(height: 16,),
              ButtonWidget(
                title: "Sign In",
                hasBorder: false,
                onClick: () {
                  print(username + " " + password);
                  if(username == "admin" && password == "admin") {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (builder) => HomeScreen())
                    );
                  } else {
                    AlertDialogWidget alert = AlertDialogWidget("Login Gagal", "Username dan Password Salah", "error");
                    alert.showAlertDialog(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
