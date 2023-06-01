import 'package:final_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Profile",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16,),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        CustomCard(title: "Kamila Richana Fauziyah\n123200031", image: "assets/images/kamila.jpeg"),
                        CustomCard(title: "Dywa Pratama Haswanto Putra\n123200041", image: "assets/images/dywa.png"),
                      ],
                    ),
                  )
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefsdata = await SharedPreferences.getInstance();
                      prefsdata.setBool('login', false);

                      //Navigasi ke login screen saat tombol logout di klik
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text("Logout"),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        backgroundColor: Colors.red,
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String image;
  CustomCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
