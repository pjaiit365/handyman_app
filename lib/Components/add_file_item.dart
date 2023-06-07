import 'package:flutter/material.dart';

import '../constants.dart';
import 'added_file_container.dart';

class AddFileItem extends StatefulWidget {
  final List selectedOptions;
  final String title;
  final String hintText;
  final VoidCallback screen;
  bool isReadOnly;
  AddFileItem({
    super.key,
    required this.title,
    this.isReadOnly = true,
    required this.hintText,
    required this.screen,
    required this.selectedOptions,
  });

  @override
  State<AddFileItem> createState() => _AddFileItemState();
}

class _AddFileItemState extends State<AddFileItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 11.0),
          child: Text(
            widget.title,
            style: TextStyle(
              color: black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 6 * screenHeight),
        GestureDetector(
          onTap: widget.isReadOnly ? () {} : widget.screen,
          child: Container(
            height: 49 * screenHeight,
            width: 310 * screenWidth,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(7),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.hintText,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w200, color: black),
                ),
                Image.asset('assets/icons/plus.png', color: black)
              ],
            ),
          ),
        ),
        widget.selectedOptions.isEmpty
            ? SizedBox(height: 0, width: 0)
            : SizedBox(height: 16 * screenHeight),
        widget.selectedOptions.isEmpty
            ? SizedBox(height: 0, width: 0)
            : ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AddedFileContainer(
                    index: index,
                    child: GestureDetector(
                      onTap: widget.isReadOnly
                          ? null
                          : () {
                              setState(() {
                                widget.selectedOptions.removeAt(index);
                              });
                            },
                      child: Image.asset('assets/icons/dash.png'),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8 * screenHeight,
                  );
                },
                itemCount: widget.selectedOptions.length),
      ],
    );
  }
}
