import 'package:recipes_app/utils/http/sqflite_setup.dart';
import 'package:sqflite/sqflite.dart';

class Crud {
  SqlDb sqlDb = SqlDb();

  Future<List<Map<String, Object?>>> readData(String sql) async {
    Database? db = await sqlDb.db;
    List<Map<String, Object?>> responce = await db!.rawQuery(sql);
    return responce;
  }

  Future<int> deleteData(String sql) async {
    Database? db = await sqlDb.db;
    int responce = await db!.rawDelete(sql);
    return responce;
  }

  Future<int> insertData(String sql) async {
    Database? db = await sqlDb.db;
    int responce = await db!.rawInsert(sql);
    return responce;
  }
}
