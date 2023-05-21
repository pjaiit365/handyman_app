import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:handyman_app/Components/profile_item.dart';

import '../../../../Components/pinned_button.dart';
import '../../../../Components/profile_item_dropdown.dart';
import '../../../../constants.dart';
import 'momo_listView.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => MomoListView(),
            itemCount: 1,
          ),
        ),
        PinnedButton(),
      ],
    );
  }
}
