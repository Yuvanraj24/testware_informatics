import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  String _email = '';
  String _name = '';
  String _mobNo = '';
  String _pass = '';
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

  @override
  void initState() {
    super.initState();
    _loademail();
    _loadName();
    _loadMobileNo();
    _loadPassword();
  }

  _loademail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = (prefs.getString('email') ?? '');
    });
  }

  _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = (prefs.getString('name') ?? '');
    });
  }

  _loadMobileNo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _mobNo = (prefs.getString('mob') ?? '');
    });
  }

  _loadPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _pass = (prefs.getString('pass') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 49, 82),
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.only(top: 30, bottom: 25, left: 20, right: 20),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _image != null
                        ? GestureDetector(
                            onTap: () {
                              pickImage(ImageSource.gallery);
                            },
                            child: ClipOval(
                              child: Image.file(
                                _image!,
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              pickImage(ImageSource.gallery);
                            },
                            child: ClipOval(
                              child: Image.network(
                                "https://newsozzy.com/wp-content/uploads/2022/05/profile-broken-dp-for-whatsapp.png",
                                fit: BoxFit.fill,
                                width: 160,
                                height: 160,
                              ),
                            )),
                    SizedBox(height: currentHeight * 0.05),
                    Text("Hello $_name", style: TextStyle(color: Colors.white)),
                    Text("Welcome to the App...!"),
                    Text("Please check the entered information are Correct"),
                    Text(
                      "$_email",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("$_mobNo", style: TextStyle(color: Colors.white)),
                    Text(
                      "$_pass",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
