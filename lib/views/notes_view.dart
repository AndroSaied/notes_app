import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/notes_body_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue.shade400,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black,),
        ),
      body: const NotesViewBody(),
    );
  }
}