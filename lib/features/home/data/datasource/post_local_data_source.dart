import 'package:sqflite/sqflite.dart';

import '../model/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getPosts();
  Future<void> savePosts(List<PostModel> posts);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  static const String _tableName = 'posts';
  static const String _databaseName = 'posts.db';
  static const int _databaseVersion = 1;
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = databasePath + _databaseName;

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, body TEXT)',
        );
      },
    );
  }

  @override
  Future<List<PostModel>> getPosts() async {
    final db = await database;
    final maps = await db.query(_tableName);

    if (maps.isNotEmpty) {
      return maps.map((map) => PostModel.fromMap(map)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> savePosts(List<PostModel> posts) async {
    final db = await database;

    for (var post in posts) {
      await db.insert(
        _tableName,
        post.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}