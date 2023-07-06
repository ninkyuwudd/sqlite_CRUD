
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter_learn/model/note_model.dart';
import 'package:path/path.dart';



class NoteService{
  static final NoteService instane = NoteService._init();
  static Database? _database;
  NoteService._init();

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDB('note.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filepath);

    return await openDatabase(path,version: 1,onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{
      final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
      final textType = 'TEXT NOT NULL';

      await db.execute(
        '''
CREATE TABLE $tableNote(
  ${NoteFields.id} $idType,
  ${NoteFields.note} $textType,
  ${NoteFields.time} $textType
)
'''
      );
  }

  Future<Note> create(Note note) async{
    final db = await instane.database;

    final id = await db.insert(
      tableNote, note.toJson()
    );
    return note.copy(id: id);
  }

  Future<Note> readNotes(int id) async{
    final db = await instane.database;

    final maps = await db.query(tableNote,
    columns: NoteFields.values,
    where: '${NoteFields.id} = ?',
    whereArgs: [id]
    );
    if(maps.isNotEmpty){
      return Note.fromJson(maps.first);
    }else{
      throw Exception('Id $id is not found');
    }
  }

  Future<List<Note>> readAllNotes() async{
    final db = await instane.database;

    final orderBy = '${NoteFields.time} ASC';
    final result = await db.query(tableNote, orderBy: orderBy);

    return result.map((json) => Note.fromJson(json)).toList();
  }



  
}