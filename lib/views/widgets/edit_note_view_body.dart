import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            SizedBox(
                height: 45,
              ),
              
            CustomAppBar(title: "Edit Note", icon: Icons.check,),

            SizedBox(
                height: 25,
              ),

            CustomTextField(hint: "Title"),

            SizedBox(
                height: 18,
              ),

            CustomTextField(hint: "Content", maxLines: 5,),
          ],
        ),
      ),
    );
  }
}