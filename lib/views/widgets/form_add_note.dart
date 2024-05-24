import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteFormState extends StatefulWidget {
  const AddNoteFormState({
    super.key,
  });

  @override
  State<AddNoteFormState> createState() => _AddNoteFormStateState();
}

class _AddNoteFormStateState extends State<AddNoteFormState> {

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        children: [ 
          const SizedBox(height: 32,),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: "Title",
          ),
          const SizedBox(height: 16,),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: "Content",
            maxLines: 5,
          ),
          const SizedBox(height: 20,),
          const ColorsListView(),
          const SizedBox(height: 20,),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                      onTap: () {
          
                        if(formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          String formattedCurrentDate = DateFormat("MMM dd,yyyy").format(DateTime.now());
                          NoteModel note = NoteModel(
                            title: title!, 
                            subtitle: subTitle!, 
                            date: formattedCurrentDate, 
                            color: Colors.yellowAccent.value);
                          BlocProvider.of<AddNoteCubit>(context).addNote(note);
                        } else {
                          autoValidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
          
                      },
                    );
            },
          ),
          const SizedBox(height: 32,)
        ],
      ),
    );
  }
}