import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'jsonModel/json-model.dart';


class DatabaseHelper {
  final databaseName = "notes.db";


  String users =
      "create table users (userId INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT UNIQUE, userPassword TEXT)";

  //We are done in this section

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
      
    });
  }

 Future<bool> login (Users user)async {
  final Database db = await initDB();
  var result = await db.rawQuery("select * from users where userName = '${user.userName}' AND userPassword = '${user.userPassword}'");
    if(result.isNotEmpty){
      return true;
    }else{
      return 1<0;
    }
 }

 //Sign up
  Future<int> signup(Users user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }



  //Delete Notes
  Future<int> deleteNote(int id) async {
    final Database db = await initDB();
    return db.delete('notes', where: 'noteId = ?', whereArgs: [id]);
  }

  //Update Notes
  Future<int> updateNote(title, content, noteId) async {
    final Database db = await initDB();
    return db.rawUpdate(
        'update notes set noteTitle = ?, noteContent = ? where noteId = ?',
        [title, content, noteId]);
  }
}