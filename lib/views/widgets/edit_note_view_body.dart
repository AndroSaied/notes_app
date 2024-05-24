import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_note_color.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

  String? title , content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            const SizedBox(
                height: 45,
              ),
              
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = content ?? widget.note.subtitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              title: "Edit Note", 
              icon: Icons.check,),

            const SizedBox(
                height: 25,
              ),

            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,
              ),

            const SizedBox(
                height: 18,
              ),

            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.subtitle, 
              maxLines: 5,
              ),
            
            EditNoteColorList(note: widget.note),
          ],
        ),
      ),
    );
  }
}