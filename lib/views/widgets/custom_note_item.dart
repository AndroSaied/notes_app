import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 5),
      decoration: BoxDecoration(
        color: const Color(0xffFCC985),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Flutter tips",
                style: TextStyle(color: Colors.black, fontSize: 24),
                ),
            ),
            subtitle: Text(
              "Build your Career with Tharwat Samy",
              style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 20),
              ),
            trailing: const Icon(
              FontAwesomeIcons.trash,
              color: Colors.black,
              size: 22,
              ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16),
              child: Text(
                "May 21,2022",
                style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 19,),
                ),
            ),
          )
        ],
      ),
    );
  }
}