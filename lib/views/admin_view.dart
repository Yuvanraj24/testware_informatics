import 'package:flutter/material.dart';
import 'package:testware_informatics/service/user_service.dart';

import '../model/user.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  late List<User> _userList;
  final _userService = UserService();

  getAllUserDetails() async {
    var users = await _userService.readAllUser();
    _userList = <User>[];

    users.forEach((user) {
      var userModel = User();

      userModel.id = user['id'];
      userModel.name = user['name'];
      userModel.mailId = user['mailId'];
      userModel.mobNo = user['mobNo'];
      userModel.password = user['password'];

      _userList.add(userModel);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQL-Lite CRUD")),
      body: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, index) {
          return Card(
          child: ListTile(
            title: Text(_userList[index].name??''),
            subtitle: Text(_userList[index].mailId??''),
          ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
