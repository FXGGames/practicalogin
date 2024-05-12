import 'package:path/path.dart';
import 'package:practicalogin/jsonModels/noteModel.dart';
import 'package:practicalogin/jsonModels/userModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final databaseName = "notas.db";
  final noteTable =
      "CREATE TABLE notas (noteId INTEGER PRIMARY KEY AUTOINCREMENT,"
      "noteTitle TEXT NOT NULL, noteContent TEXT NOT NULL, createdAt TEXT CURRENT_TIMESTAMP) ";

  String users = "CREATE TABLE Users (UserId INTEGER PRIMARY KEY AUTOINCREMENT, UserName TEXT UNIQUE, UserEmail TEXT, UserPass TEXT)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
      await db.execute(noteTable);
    });
  }

  //Metodos de Login y registro

  Future<bool> login(Users user) async {
    final Database db = await initDB();

    var resultado = await db.rawQuery(
        "SELECT * from Users WHERE userName = '${user.userName}' AND userPass = '${user.userPass}'");
    if (resultado.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> registro(Users user) async {
    final Database db = await initDB();
     return db.insert('Users', user.toMap() );
  }

  //Search Method
  Future<List<NoteModel>> searchNote(String keyword) async {
    final Database db = await initDB();
    List<Map<String, Object?>> searchResult = await db
        .rawQuery("SELECT * FROM notas WHERE noteTitle LIKE ?", ["%$keyword%"]);
    return searchResult.map((e) => NoteModel.fromMap(e)).toList();
  }

//Metodos CRUD

//Crear Nota

  Future<int> createNote(NoteModel note) async {
    final Database db = await initDB();
    return db.insert("notas", note.toMap());
  }

//Ver todas las notas

  Future<List<NoteModel>> getNotes() async {
    final Database db = await initDB();
    List<Map<String, Object?>> resultado = await db.query("notas");
    return resultado.map((e) => NoteModel.fromMap(e)).toList();
  }

//Editar Notas

  Future<int> updateNote(title, content, noteId) async {
    final Database db = await initDB();
    return db.rawUpdate(
        'update notas set noteTitle = ?, noteContent = ? where noteId = ?',
        [title, content, noteId]);
  }

//Borrar Nota

  Future<int> deleteNote(int id) async {
    final Database db = await initDB();
    return db.delete("notas", where: 'noteId = ?', whereArgs: [id]);
  }
}
