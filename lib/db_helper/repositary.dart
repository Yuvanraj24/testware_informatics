import 'package:sqflite/sqflite.dart';
import 'package:testware_informatics/db_helper/database_connection.dart';

class Repositary {
  late DatabaseConnection _databaseConnection;
  Repositary() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDataBase();
      return _database;
    }
  }

  //Insert User
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  //Read All the user Data
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  //Read Single user data by ID
  readDataByID(table, userId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [userId]);
  }

  //Update User
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Delete User
  deleteDataById(table, userId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$userId");
  }
}
