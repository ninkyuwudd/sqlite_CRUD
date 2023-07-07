import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_flutter_learn/model/note_model.dart';
import 'package:sqlite_flutter_learn/provider/note_provider.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  @override
  void initState() {
    // TODO: implement initState

      Provider.of<NoteProvider>(context,listen: false).refreshNote();

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
      var loadNote = Provider.of<NoteProvider>(context);
      var getNote = loadNote.note;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: getNote.length,
          itemBuilder: (context,idx){
          return ListTile(
            title: Text(getNote[idx].note),
            trailing: IconButton(onPressed: (){
              loadNote.updateNote(Note(id: getNote[idx].id,note: "edited note", createTime: DateTime.now().toString()), int.parse(getNote[idx].id.toString()));
            }, icon:const Icon(Icons.edit))
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        loadNote.inserNote(Note(note:"new note", createTime: DateTime.now().toString()));
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}