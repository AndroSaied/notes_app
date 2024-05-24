import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int? currentColor;
  List<Color> colors = const [
    Color(0xff8CFF98),
    Color(0xff5F634F),
    Color(0xff9BC4CB),
    Color(0xffFFA69E),
    Color(0xffAA4465),
  ];
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                currentColor = index;
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isActive: currentColor == index,
              ),
            ),
          );
        },),
    );
  }
}