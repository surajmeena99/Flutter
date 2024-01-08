import 'package:database/models/note_model.dart';
import 'package:database/services/database_helper.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key, this.note});

  final Note? note;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    if(note != null){
      titleController.text = note!.title;
      descriptionController.text = note!.description;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? 'Add a note' : 'Edit note'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Center(
                child: Text("What are you thinking about", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: TextFormField(
                controller: titleController,
                maxLines: 1,
                onChanged: (str){},
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  labelText: 'Note title',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )
                ),
              ),
            ),
            TextFormField(
              controller: descriptionController,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              onChanged: (str){},
              decoration: const InputDecoration(
                hintText: 'Type here the note',
                labelText: 'Note description',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async{
                    final title = titleController.value.text;
                    final description = descriptionController.value.text;

                    if(title.isEmpty || description.isEmpty){
                      return;
                    }

                    final Note model = Note(id: note?.id, title: title, description: description);
                    if(note == null){
                      await DatabaseHelper.addNote(model);
                    }else{
                      await DatabaseHelper.updateNote(model);
                    }

                    Navigator.pop(context);
                  }, 
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )
                      )
                    )
                  ),
                  child: Text(note == null ? 'Save' : 'Edit', style: const TextStyle(fontSize: 20),)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}