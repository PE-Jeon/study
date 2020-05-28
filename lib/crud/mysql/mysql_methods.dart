
import 'package:flutter/cupertino.dart';
import 'package:random_string/random_string.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:study/datamodels/user.dart';

class DBHelper {

  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'user.db');
    var db = await openDatabase(path, version: 2, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute('''
        CREATE TABLE user 
        (id INTEGER PRIMARY KEY, 
        uid VARCHAR, 
        company VARCHAR, 
        department VARCHAR, 
        division VARCHAR, 
        email VARCHAR, 
        firstName VARCHAR, 
        middleName VARCHAR, 
        lastName VARCHAR, 
        position VARCHAR, 
        status VARCHAR, 
        team VARCHAR)''');
  }

  Future<List<Map>> selectAllUsers() async {
    var dbClient = await db;

  }

  Future<User> add(User user) async {
    var dbClient = await db;
    user.uid = randomAlphaNumeric(28);
    debugPrint("user.id = " + user.id.toString());
    debugPrint("user.uid = " + user.uid.toString());
    user.id = await dbClient.insert('user', user.toMap(user));
    debugPrint("user.id = " + user.id.toString());

    return user;
  }

  Future<List<User>> getUsers() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(
    'user', 
    columns: 
    ['id', 
    'uid',
    'company',
    'department',
    'division',
    'email',
    'firstName',
    'middleName',
    'lastName',
    'position',
    'status',
    'team']);
    List<User> users = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        users.add(User.fromMap(maps[i]));
      }
    }
    return users;
  }

  Future userQuery(String _userQuery) async {
    var dbClient = await db;
    //await dbClient.rawDelete('delete from user');
    //List<Map> result = await dbClient.rawQuery(_userQuery);


    //await dbClient.execute('drop table user');
    List<Map> result = await dbClient.rawQuery('select * from user');
    debugPrint("### result of rawQuery ###\n" + result.toString());

    int i = await dbClient.getVersion();
    debugPrint(i.toString());

  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    List<Map> users = await dbClient.rawQuery('select * from user');
    debugPrint(users.toString());
    return await dbClient.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(User user) async {
    var dbClient = await db;

    return await dbClient.update(
      'user',
      user.toMap(user),
      where: 'id = ?',
      whereArgs: [user.uid],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}