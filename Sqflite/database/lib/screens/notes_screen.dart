import 'package:database/models/note_model.dart';
import 'package:database/screens/note_screen.dart';
import 'package:database/services/database_helper.dart';
import 'package:database/widgets/note_widget.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, 
            MaterialPageRoute(builder: (context)=>const NoteScreen())        
          );
          setState(() {});
        },
        child: const Icon(Icons.add,size: 34,),
      ),
      body: FutureBuilder<List<Note>?>(
        future: DatabaseHelper.getAllNotes(),
        builder: (context, AsyncSnapshot<List<Note>?> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }else if(snapshot.hasData){
            if(snapshot.data != null){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder:(context ,index) => NoteWidget(
                  note: snapshot.data![index], 
                  onTap: () async{
                  await Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => NoteScreen(  //...
                      note: snapshot.data![index],
                    )),
                  );
                  setState(() {
                    
                  });
                }, 
                onLongPress: () async {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: const Text("Are you survar you want to delete ?"),
                      actions: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () async {
                            await DatabaseHelper.deleteNote(snapshot.data![index]);
                            Navigator.pop(context);
                          setState(() {
                            
                          });
                        }, child: const Text("Yes")),
                        ElevatedButton(
                          onPressed: ()=>Navigator.pop(context), 
                          child: const Text("No"),
                        ),
                      ],
                    );
                  });
                }),
              );
            }else{
              return const Center(
                child: Text("Enter Some Note",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
              );
            }
          }else{
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
