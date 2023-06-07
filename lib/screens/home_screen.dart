import 'package:flutter/material.dart';
import 'package:praktpm_responsi/screens/login_screen.dart';
import 'package:praktpm_responsi/screens/movie_list_screen.dart';
import 'package:praktpm_responsi/utils/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/button_widget.dart';
import '../widgets/textField_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String keyword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SEARCH MOVIES",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: logoutButtonColor
                  ),
                  onPressed: () {
                    logout();
                  },
                  child: Text("Logout")
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextFieldWidget(
              hintText: "Cari Film",
              suffixIcon: Icons.search,
              obscureText: false,
              inputType: TextInputType.text,
              onChange: (value) {
                keyword = value;
              }, fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ButtonWidget(
              title: 'CARI',
              hasBorder: false,
              onClick: () {
                search();
              },
            ),
          )
        ],
      ),
    );
  }

  logout() async {
    SharedPreferences prefsdata = await SharedPreferences.getInstance();
    prefsdata.setBool('login', false);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
  }

  search() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return MovieListScreen(keyword: keyword);
        }));
  }
}
