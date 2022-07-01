
import 'package:testware_informatics/db_helper/repositary.dart';

import '../model/user.dart';

class UserService {
  late Repositary _repositary;
  UserService() {
    _repositary = Repositary();
  }

  //Save user
  saveUser(User user) async {
    return _repositary.insertData("users", user.userMap());
  }

   //Read all users
  readAllUser() async {
    return await _repositary.readData('users');
  }
}
