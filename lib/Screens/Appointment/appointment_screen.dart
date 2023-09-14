import 'package:flutter/material.dart';
import 'package:handyman_app/Components/default_back_button.dart';

import 'package:handyman_app/Screens/Appointment/Components/body.dart';
import 'package:handyman_app/Screens/Chat/Components/chat_alternate_screen.dart';
import 'package:handyman_app/Services/read_data.dart';

import '../../Components/schedule_day_tab.dart';
import '../../Components/schedule_time_tab.dart';
import '../../constants.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  void initState() {
    if (timeList.length > 5) {
      timeList.removeAt(5);
    }
    selectedDay = 0;
    selectedTime = 0;
    addressValue = 'Home';
    apppointmentTown = '';
    apppointmentStreet = '';
    apppointmentHouseNum = '';
    apppointmentRegion = '';
    dropdownvalue = 'N/A';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(),
        backgroundColor: white,
        title: Text(
          'Appointment',
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          InkWell(
            highlightColor: sectionColor,
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              ReadData().getPhoneNumber('Customer', context, true);
            },
            child: Image.asset('assets/icons/call.png', color: primary),
          ),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 10.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              highlightColor: sectionColor,
              onTap: () {
                ReadData().getPhoneNumber('Customer', context, false);
              },
              child: Image.asset('assets/icons/message.png', color: primary),
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: Body(),
    );
  }
}
