import 'package:flutter/material.dart';
import 'package:handyman_app/constants.dart';

import '../../../Components/contact_personnel_button.dart';
import '../../../Components/personnel_details_tab.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PersonnelDetailsTab(),
        SizedBox(height: 23 * screenHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactPersonnelButton(
              call: true,
              press: () {},
            ),
            ContactPersonnelButton(
              call: false,
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
