import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/form_add_note.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if(state is AddNoteSuccess) {
                Navigator.pop(context);
              } else if(state is AddNoteFailure) {
                print("Failed, ${state.errMessage}");
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing:  state is AddNoteLoading ? true : false ,
                child: const SingleChildScrollView(
                  child: AddNoteFormState(),
                  ),
                );
            },
          ),
        ),
    );
  }
}
