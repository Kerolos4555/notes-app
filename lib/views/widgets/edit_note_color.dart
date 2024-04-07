import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class EditNoteColor extends StatefulWidget {
  final NoteModel note;
  const EditNoteColor({super.key, required this.note});

  @override
  State<EditNoteColor> createState() => _EditNoteColorState();
}

class _EditNoteColorState extends State<EditNoteColor> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColorsList.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColorsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColorsList[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColorsList[index],
                isSelected: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
