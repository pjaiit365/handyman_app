import 'package:flutter/material.dart';

import '../constants.dart';

class TextfieldBar extends StatelessWidget {
  const TextfieldBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 84 * screenHeight,
          width: 390 * screenWidth,
          decoration: BoxDecoration(color: sectionColor, boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              offset: Offset(0, -2),
              blurRadius: 17,
              spreadRadius: 0,
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 13 * screenWidth),
              GestureDetector(
                onTap: () {},
                child: Image.asset('assets/icons/emoji.png'),
              ),
              SizedBox(width: 9 * screenWidth),
              GestureDetector(
                onTap: () {},
                child: Image.asset('assets/icons/attachment.png'),
              ),
              SizedBox(width: 12 * screenWidth),
              Container(
                height: screenHeight * 50.62,
                width: 255 * screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 10.0),
                  child: TextField(
                    cursorHeight: 22,
                    autofocus: true,
                    autocorrect: true,
                    enableSuggestions: true,
                    clipBehavior: Clip.antiAlias,
                    cursorColor: black.withOpacity(0.6),
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'Send message ...',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: black,
                          fontSize: 16,
                        )),
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      color: black,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 6 * screenWidth),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send_outlined,
                    color: primary,
                    size: 29,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
