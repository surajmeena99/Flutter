import 'package:database/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.note, required this.onTap, required this.onLongPress});

  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(note.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(note.description, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}