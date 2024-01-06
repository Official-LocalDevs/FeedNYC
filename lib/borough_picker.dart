import 'package:flutter/material.dart';
import 'package:foodnyc/constants.dart';

class TagPicker extends StatefulWidget {
  const TagPicker({
    super.key,
    required this.label,
    required this.boroughs,
    required this.selected,
  });

  final List<String> boroughs;
  final List<bool> selected;
  final String label;

  @override
  State<TagPicker> createState() => _TagPickerState();
}

class _TagPickerState extends State<TagPicker> {
  @override
  Widget build(BuildContext context) {
    void _onSelectBorough(int index) {
      setState(() {
        widget.selected[index] = !widget.selected[index];
      });
    }

    return Column(children: [
      Row(
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: labelSize,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      SizedBox(height: 5),
      SizedBox(
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.boroughs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: GestureDetector(
                onTap: () {
                  _onSelectBorough(index);
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      widget.boroughs[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: widget.selected[index] ? Colors.white : green4,
                        fontSize: tagSize,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: widget.selected[index] ? green4 : green1,
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: green4,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
    ]);
  }
}
