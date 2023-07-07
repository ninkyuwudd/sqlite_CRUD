import 'package:flutter/material.dart';
import 'package:sqlite_flutter_learn/model/note_model.dart';


class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({super.key});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {

  var title = TextEditingController();
  var note = TextEditingController();

  @override
  void initState() {
     WidgetsBinding.instance!.addPostFrameCallback((_) {
          var getNote = ModalRoute.of(context)?.settings.arguments as Note;

    title.text = getNote.title;
    note.text = getNote.note;
    });


    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            TextFormField(
              controller: title,
            ),
            const SizedBox(height: 20),
            const Text("Note",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            TextFormField(
              controller: note,
              maxLines: 5,
              decoration: InputDecoration(
              
              ),
            )
          ],
        ),
      ),
    );
  }
}