import 'package:sqflite/sqflite.dart';

class DBhelper {
  static Database? _db;
  // ignore: body_might_complete_normally_nullable
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
  }
}
