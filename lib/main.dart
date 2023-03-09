import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

void main() {
  runApp(const MyApp());
}

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void onLogin(BuildContext context) {
    String username = usernameController.text.toString();
    String password = passwordController.text.toString();

    if(username.isEmpty || password.isEmpty){
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Login Failed!",
          text: "Username or Password cannot be empty"
      );
    } else {
      if(username == "admin" && password == "admin") {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: "Login Succeed!",
        );
      } else {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "Login Failed!",
            text: "Username or Password wrong"
        );
      }
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/bg_login.png"),
            fit: BoxFit.cover,
            opacity: 0.9
          )
        ),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FlutterLogo(
                        size: 100,
                      ),

                      const SizedBox(height: 12,),

                      //Login Text
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                        ),
                      ),

                      const SizedBox(height: 12,),

                      //Login Greeting
                      const Text(
                        "Please sign in to continue",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),

                      const SizedBox(height: 32,),

                      //Username
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: ('Username'),
                          labelStyle: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                      const SizedBox(height: 24,),

                      //Username
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password_rounded),
                          labelText: ('Password'),
                          labelStyle: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),

                      const SizedBox(height: 24,),

                      //Login Button
                      Container(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: 180,
                          child: Builder(
                            builder: (context) => ElevatedButton(
                                onPressed: () => onLogin(context),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0)
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  backgroundColor: Colors.blue,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'LOGIN',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
          ),
        )
      ),
    );
  }


}
