import 'package:flutter/material.dart';

import '../constants.dart';

class HomeScreenTabs extends StatelessWidget {
  final String title;
  final Widget screen;
  const HomeScreenTabs({
    Key? key,
    required this.title,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ));
      },
      child: Container(
        height: size.height * 0.2132,
        width: size.width * 0.4958,
        decoration: BoxDecoration(
          color: tabLight,
          borderRadius: BorderRadius.circular(23),
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(0.10),
              spreadRadius: 10.0,
              blurRadius: 10,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: primary, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
