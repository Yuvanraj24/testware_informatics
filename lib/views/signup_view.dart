import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testware_informatics/service/user_service.dart';
import 'package:testware_informatics/views/login_view.dart';
import 'package:testware_informatics/views/profile_view.dart';

import '../model/user.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var _userNameController = TextEditingController();
  var _mailController = TextEditingController();
  var _mobileController = TextEditingController();
  var _passwordController = TextEditingController();

  bool _validateName = false;
  bool _validateMail = false;
  bool _validateMobile = false;
  bool _validatePassword = false;

  String _email = '';
  String _name = '';
  String _mobileNo = '';
  String _pass = '';

  var _userService = UserService();

  File? _image;

  //function to pick image
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Unable to pick image: $e");
    }
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = (prefs.getString('email') ?? '');
      _name = (prefs.getString('name') ?? '');
      _mobileNo = (prefs.getString('mob') ?? '');
      _pass = (prefs.getString('pass') ?? '');
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = "${_mailController.text}";
      _name = "${_userNameController.text}";
      _mobileNo = "${_mobileController.text}";
      _pass = "${_passwordController.text}";
    });
    prefs.setString('email', _email);
    prefs.setString('name', _name);
    prefs.setString('mob', _mobileNo);
    prefs.setString('pass', _pass);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 9, 49, 82),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: currentHeight * 0.09,
                  ),
                  Text(
                    "Sign-up",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: currentHeight * 0.05,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: currentHeight * 0.04),
                  TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black54,
                      ),
                      errorText:
                          _validateName ? "User Name cant be empty" : null,
                      labelText: "User Name",
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: currentWidth * 0.04),
                    ),
                  ),
                  SizedBox(height: currentHeight * 0.02),
                  TextField(
                    controller: _mailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.black54,
                      ),
                      errorText: _validateMail ? "Mail ID cant be empty" : null,
                      labelText: "Mail ID",
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: currentWidth * 0.04),
                    ),
                  ),
                  SizedBox(height: currentHeight * 0.02),
                  TextField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.mobile_friendly_rounded,
                        color: Colors.black54,
                      ),
                      errorText: _validateMobile
                          ? "Mobile Number cant be empty"
                          : null,
                      labelText: "Mobile",
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: currentWidth * 0.04),
                    ),
                  ),
                  SizedBox(height: currentHeight * 0.02),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock_person,
                        color: Colors.black54,
                      ),
                      errorText:
                          _validatePassword ? "Password cant be empty" : null,
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: currentWidth * 0.04),
                    ),
                  ),
                  SizedBox(height: currentHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _image != null
                          ? GestureDetector(
                              onTap: () {
                                pickImage(ImageSource.gallery);
                              },
                              child: Container(
                                child: Image.file(
                                  _image!,
                                  width: currentWidth * 0.4,
                                  height: currentHeight * 0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                pickImage(ImageSource.gallery);
                              },
                              child: Container(
                                width: currentWidth * 0.4,
                                height: currentHeight * 0.2,
                                decoration:
                                    BoxDecoration(color: Colors.white70),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.image),
                                    Text(
                                      "Tap to\nupload picture",
                                      style: TextStyle(
                                        fontSize: currentWidth * 0.03,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            )
                    ],
                  ),
                  SizedBox(height: currentHeight * 0.03),
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _userNameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _mailController.text.isEmpty
                              ? _validateMail = true
                              : _validateMail = false;
                          _mobileController.text.isEmpty
                              ? _validateMobile = true
                              : _validateMobile = false;
                          _passwordController.text.isEmpty
                              ? _validatePassword = true
                              : _validatePassword = false;
                        });
                        _incrementCounter();
                        if (_validateName == false &&
                            _validateMail == false &&
                            _validateMobile == false &&
                            _validatePassword == false) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                          onPrimary: Color.fromARGB(255, 92, 134, 168),
                          minimumSize:
                              Size(currentWidth, currentHeight * 0.07)),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: currentWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),

                  SizedBox(height: currentHeight * 0.03),

                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()));
                      },
                      child: Text(
                        "Already a User...!",
                        style: TextStyle(
                            fontSize: currentWidth * 0.04,
                            color: Colors.white70),
                      ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
