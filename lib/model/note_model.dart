
import 'dart:convert';

final String tableNote = "notes";

class NoteFields{
  static final List<String> values = [
    id,title,note,time
  ];

  static final String id = 'id';
  static final String title = 'title';
  static final String note = 'note';
  static final String time = 'createTime';
}

// Note noteFromJson(String str) => Note.fromJson(json.decode(str));

// String noteToJson(Note data) => json.encode(data.toJson());

class Note {
    int? id;
    String title;
    String note;
    String createTime;

    Note({
        this.id,
        required this.title,
        required this.note,
        required this.createTime,
    });

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"] as int?,
        title: json["title"],
        note: json["note"],
        createTime: json["createTime"],
    );

    Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.note: note,
        NoteFields.time: createTime,
    };

    Note copy({
    int? id,
    String? title,
    String? note,
    String? createTime,
    }) => Note(id: id?? this.id, note: note?? this.note, createTime: createTime?? this.createTime, title: title ?? this.title);
}
