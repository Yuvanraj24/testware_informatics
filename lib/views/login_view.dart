import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testware_informatics/views/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 9, 49, 82),
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.only(left: 18, right: 18, top: 40, bottom: 10),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: currentWidth * 0.4,
                    ),
                    SizedBox(height: currentHeight * 0.05),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: UnderlineInputBorder(),
                          labelText: "Email/User Name",
                          labelStyle: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: currentWidth * 0.04)),
                    ),
                    SizedBox(height: currentHeight * 0.05),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: UnderlineInputBorder(),
                          labelText: "Enter Password",
                          labelStyle: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: currentWidth * 0.04)),
                    ),
                    SizedBox(height: currentHeight * 0.02),
                    TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password",
                            style: TextStyle(
                                fontSize: currentWidth * 0.04,
                                color: Colors.white70,
                                decoration: TextDecoration.underline))),
                    SizedBox(height: currentHeight * 0.04),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[900],
                            onPrimary: Color.fromARGB(255, 92, 134, 168),
                            minimumSize:
                                Size(currentWidth, currentHeight * 0.06)),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: currentWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    SizedBox(height: currentHeight * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white70,
                                onPrimary: Colors.black12,
                                minimumSize: Size(
                                    currentWidth * 0.4, currentHeight * 0.07)),
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Color.fromARGB(255, 70, 25, 25),
                              size: currentWidth * 0.07,
                            ),
                            label: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: currentWidth * 0.04,
                                  color: Colors.black87),
                            )),
                        SizedBox(width: currentWidth * 0.04),
                        ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white70,
                                onPrimary: Colors.black12,
                                minimumSize: Size(
                                    currentWidth * 0.4, currentHeight * 0.07)),
                            icon: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue[600],
                              size: currentWidth * 0.07,
                            ),
                            label: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: currentWidth * 0.04,
                                  color: Colors.black87),
                            )),
                      ],
                    ),
                    SizedBox(height: currentHeight * 0.03),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpView(),
                              ));
                        },
                        child: Text(
                          "Click here to sign-up...!",
                          style: TextStyle(
                              fontSize: currentWidth * 0.04,
                              color: Colors.white70),
                        ))
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
