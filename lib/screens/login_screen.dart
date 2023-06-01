import 'package:bcrypt/bcrypt.dart';
import 'package:final_project/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/user.dart';
import '../utils/boxes.dart';
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
                          Expanded(
                            child: Lottie.asset(
                              'assets/lottie/login.json',
                              animate: true,
                            ),
                          ),
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
  bool _isLogin = true;
  String fullname = "";
  String username = "";
  String password = "";

  late AlertDialogWidget alert;

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
              _LoginFormTitle(),
              SizedBox(height: 32,),

              if(!_isLogin) _LoginFormFullname(),
              if(!_isLogin) SizedBox(height: 16,),

              _loginFormUsername(),
              SizedBox(height: 16,),

              _loginFormPassword(),
              SizedBox(height: 16,),

              _loginFormButton(),
              SizedBox(height: 16,),

              _loginFormNavigation()
            ],
          ),
        ),
      ),
    );
  }

  Widget _LoginFormTitle() {
    return Text(
      "Genting App",
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _LoginFormFullname() {
    return new TextFieldWidget(
      hintText: "Full Name",
      prefixIcon: Icons.person,
      obscureText: false,
      inputType: TextInputType.text,
      onChange: (value) {
        fullname = value;
      }, fillColor: kLightColor,
    );
  }

  Widget _loginFormUsername() {
    return new TextFieldWidget(
      hintText: "Username",
      prefixIcon: Icons.person,
      obscureText: false,
      inputType: TextInputType.text,
      onChange: (value) {
        username = value;
      }, fillColor: kLightColor,
    );
  }

  Widget _loginFormPassword() {
    return new TextFieldWidget(
      hintText: "Password",
      prefixIcon: Icons.lock,
      obscureText: true,
      inputType: TextInputType.text,
      onChange: (value) => {
        password = value
      }, fillColor: kLightColor,
    );
  }

  Widget _loginFormButton() {
    return ButtonWidget(
      title: _isLogin ? "Sign In" : "Register",
      hasBorder: false,
      onClick: () {
        if(_isLogin) onLogin();
        else onRegister();
      },
    );
  }

  Widget _loginFormNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_isLogin ? "Belum punya akun ? " : "Sudah punya akun ? "),
        TextButton(
            onPressed: () {
              setState(() {
                _isLogin = !_isLogin;
              });
            },
            child: Text(_isLogin ? "Register sekarang" : "Login sekarang")
        )
      ],
    );
  }

  //Fungsi on login dipanggil ketika tombol login diklik
  Future<void> onLogin() async {
    //Cek apakah form valid
    if(username == "" || password == "") {
      alert = AlertDialogWidget(
          "Login Gagal",
          "Username dan Password tidak boleh kosong",
          "error"
      );
      alert.showAlertDialog(context);
    } else {
      bool isUsernameAda = false;
      User? userTemp;

      //Ambil data dari local database
      var userList = Hive.box<User>(HiveBoxex.user);

      //Cek apakah user ada
      for(var i = 0; i < userList.length; i++) {
        var user = userList.getAt(i);
        if(username == user?.username){
          isUsernameAda = true;
          userTemp = user;
        }
      }

      //Username ada
      if(isUsernameAda) {

        //cek password sesuai atau tidak
        String pass = userTemp!.password.toString();
        bool plaintext = BCrypt.checkpw(password, pass);

        //Jika password sesuai (login sukses)
        if (plaintext) {
          SnackBar snackBar = SnackBar(
            content: Text("Login Sukses"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          SharedPreferences prefsdata = await SharedPreferences.getInstance();
          prefsdata.setBool('login', true);

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
        }

        //Jika password tidak sesuai (login gagal)
        else {
          alert = AlertDialogWidget(
              "Login Gagal",
              "Password Salah",
              "error"
          );
          alert.showAlertDialog(context);
        }
      }

      //Jika username tidak ditemukan
      else {
        alert = AlertDialogWidget(
            "Login Gagal",
            "Username tidak ditemukan",
            "error"
        );
        alert.showAlertDialog(context);
      }
    }
  }

  //Fungsi on register dipanggil ketika tombol register diklik
  void onRegister() async {
    //Cek apakah form valid
    if(username == "" || password == "" || fullname == "") {
      alert = AlertDialogWidget(
          "Register Gagal",
          "Harap isi semua field",
          "error"
      );
      alert.showAlertDialog(context);
    } else {
      bool isUserAda = false;

      //Ambil data dari local database
      Box<User> userBox = Hive.box<User>(HiveBoxex.user);

      //Cek jika username sudah pernah dipakai
      for(var i = 0; i < userBox.length; i++) {
        var user = userBox.getAt(i);

        if(user?.username == username) isUserAda = true;
      }

      //Jika user belum pernah dipakai
      if(!isUserAda) {
        //Enkripsi password
        var chipertext = BCrypt.hashpw(password, BCrypt.gensalt());
        print("Encrypt Result : " + chipertext);

        //Simpan data ke local database
        userBox.add(User(username: username, password: chipertext, fullname: fullname));

        setState(() {
          _isLogin = true;
        });

        //Register berhasil
        alert = AlertDialogWidget(
            "Register Berhasil",
            "Silahkan Login",
            "success"
        );
        alert.showAlertDialog(context);
      }

      //gagal (username sudah pernah dipakai)
      else {
        alert = AlertDialogWidget(
            "Register Gagal",
            "Username sudah terpakai",
            "error"
        );
        alert.showAlertDialog(context);
      }
    }
  }
}
