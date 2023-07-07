import 'package:flutter/material.dart';
import 'package:sqlite_flutter_learn/model/note_model.dart';
import 'package:sqlite_flutter_learn/service/note_service.dart';

class NoteProvider extends ChangeNotifier {
  late List<Note> note = [];
  List<Note> get notes => note;

  bool isLoading = false;

  Future refreshNote() async {
    isLoading = true;

    this.note = await NoteService.instane.readAllNotes();

    isLoading = false;
    notifyListeners();
  }

  Future<void> inserNote(Note note) async{
    final createdNote = await NoteService.instane.create(note);
    notes.add(createdNote);
    refreshNote();
    print("Try to add notes");
    notifyListeners();
  }

  Future<void> updateNote(Note note,int id) async{
    await NoteService.instane.update(note, id);
    refreshNote();
    notifyListeners();
    print("Update data");
  }
}