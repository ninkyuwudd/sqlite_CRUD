
import 'dart:convert';

final String tableNote = "note";

class NoteFields{
  static final List<String> values = [
    id,note,time
  ];

  static final String id = 'id';
  static final String note = 'note';
  static final String time = 'createTime';
}

Note noteFromJson(String str) => Note.fromJson(json.decode(str));

String noteToJson(Note data) => json.encode(data.toJson());

class Note {
    int? id;
    String note;
    String createTime;

    Note({
        this.id,
        required this.note,
        required this.createTime,
    });

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        note: json["note"],
        createTime: json["createTime"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
        "createTime": createTime,
    };

    Note copy({
    int? id,
    String? note,
    String? createTime,
    }) => Note(id: id?? this.id, note: note?? this.note, createTime: createTime?? this.createTime);
}
