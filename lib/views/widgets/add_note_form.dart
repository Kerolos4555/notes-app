import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/color_list_view.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title;
  String? subTitle;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField(
            onSaved: (value) {
              title = value;
            },
            hint: "Title",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: "Content",
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return addNoteCustomButton(state, context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  CustomButton addNoteCustomButton(AddNoteState state, BuildContext context) {
    return CustomButton(
      isLoading: state is AddNoteLoading ? true : false,
      text: "Add",
      onTap: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          var noteModel = NoteModel(
            title: title!,
            subTitle: subTitle!,
            date: DateFormat.yMMMd().format(DateTime.now()),
            color: BlocProvider.of<AddNoteCubit>(context).color.value,
          );
          BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
        } else {
          autovalidateMode = AutovalidateMode.always;
          setState(() {});
        }
      },
    );
  }
}
