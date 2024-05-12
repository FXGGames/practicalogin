import 'package:flutter/material.dart';
import '../SQLite/Database.dart';
import '../jsonModels/noteModel.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final title = TextEditingController();
  final content = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final db = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear nueva nota"),
        actions: [
          IconButton(
              onPressed: () {
                //Add Note button
                //We should not allow empty data to the database
                if (formKey.currentState!.validate()) {
                  db
                      .createNote(NoteModel(
                      noteTitle: title.text,
                      noteContent: content.text,
                      createdAt: DateTime.now().toIso8601String()))
                      .whenComplete(() {
                    //When this value is true
                    Navigator.of(context).pop(true);
                  });
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        //I forgot to specify key
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Se requiere un titulo!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Titulo"),
                  ),
                ),
                TextFormField(
                  controller: content,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "La nota no tiene contenido!";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Contenido"),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}