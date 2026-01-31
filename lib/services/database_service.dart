import 'package:memorystack/models/memory.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _memoryTableName = "memories";
  final String _memoryIdColumnName = "id";
  final String _memoryNameColumnName = "name";
  final String _memoryDescColumnName = "description";

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $_memoryTableName (
          $_memoryIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
          $_memoryNameColumnName TEXT NOT NULL,
          $_memoryDescColumnName TEXT NOT NULL
        )
        ''');
      },
    );
    return database;
  }

  void addMemory(String name, String description) async {
    final db = await database;
    await db.insert(_memoryTableName, {
      _memoryNameColumnName: name,
      _memoryDescColumnName: description,
    });
  }

  Future<List<Memory>> getMemorys() async {
    final db = await database;
    final data = await db.query(_memoryTableName);
    List<Memory> memories = data
        .map(
          (e) => Memory(
            id: e["id"] as int,
            name: e["name"] as String,
            description: e["description"] as String,
          ),
        )
        .toList();
    return memories;
  }

  void deleteMemory(int id) async {
    final db = await database;
    await db.delete(
      _memoryTableName,
      where: '$_memoryIdColumnName = ?',
      whereArgs: [id],
    );
  }
}
