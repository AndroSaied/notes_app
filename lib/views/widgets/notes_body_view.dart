import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        children: [
      
          SizedBox(
            height: 45,
          ),
      
          CustomAppBar(title: "Notes", icon: Icons.search,),

          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}