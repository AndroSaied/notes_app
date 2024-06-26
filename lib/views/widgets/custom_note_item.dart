import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/models/note_model.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return EditNoteView(note: note,);
        },));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 5),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  note.title,
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                  ),
              ),
              subtitle: Text(
                note.subtitle,
                style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 20),
                ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                }, 
                icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.black,
                size: 22,
                ),
                ),
            ),
      
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16),
                child: Text(
                  note.date,
                  style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 19,),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}