import 'package:flutter/material.dart';

late double width;
late double height;

Color white = Color(0xffffffff);
Color primary = const Color(0xff32B5BD);
Color tabLight = Color(0xffFAFAFA);
Color red = Color(0xffF53939);
Color green = Color(0xff1EDB53);
Color black = Color(0xff000000);
Color yellow = Color(0xffFFC10A);
Color pink = Color(0xffFF7B92);
Color sectionColor = Color(0xffF5F7F9);
Color grey = Color(0xffD9D9D9);
Color chatBlue = Color(0xff0076F7);
Color chatRed = Color(0xffFF1AA3);
Color chatGrey = Color(0xffF2F4F5);
Color textGreyColor = Color(0xff9BA1A9);
Color chatTimeColor = Color(0xffA7A4A4);
Color appointmentTimeColor = Color(0xffA7A5A5);
Color dividerColor = Color(0xff929292);
Color ratingTextColor = Color(0xff666060);

double screenWidth = width / 390;
double screenHeight = height / 844;

final bool status = true;
bool call = true;

bool aboutSelected = true;
bool reviewsSelected = false;
bool portfolioSelected = false;

late bool isTabSelected;
List<String> servicesList = [
  'Painting',
  'Electrical Repairs',
  'Grass Cutting',
  'Painting',
  'Electrical Repairs',
  'Grass Cutting'
];

List<String> ratingNames = ['Khufra', 'Eben', 'Clay'];
List<String> ratingTimePosted = ['Just now', '2 days ago', '1 week ago'];
List<String> ratingComment = [
  'Professional and hard-working painter. 👌',
  'Neat work done. Highly recommended. 👍',
  'Man used emulsion paint when I said I want oil paint. Bad choice.💩🚮'
];
List<bool> isCommentLiked = [true, false, true];

List<double> ratingsWidth = [140, 100, 35, 12, 0];

List statusOptions = [false, true, true, false, false, false, true, true, true];

late int starsGiven;
bool isGridViewSelected = true;
bool isSingleViewSelected = false;
List ratingStars = [4, 5, 1];

List<String> daysList = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
List<String> dateList = ['11', '12', '13', '14', '15', '16', '17'];
List<String> timeList = [
  '8:00 AM',
  '10:00 AM',
  '12:30 PM',
  '3:00 PM',
  '5:00 PM'
];
bool isDateSelected = false;
bool isAddressBarClicked = false;
bool isTimeSelected = false;
bool isDashboardTabSelected = false;
bool isSummaryClicked = false;

List<String> addressTypesDD = [
  'Home',
  'Office',
  'Hotel / Hostel',
  'Warehouse',
];

List<String> dashBoardTabList = [
  'Painter',
  'Electrician',
  'Carpenter',
  'Gardener',
  'Gardener on the rollll',
];

final serviceCategoryList = [
  'Plumbing',
  'Painting',
  'Electrical Repairs',
  'Gardeners'
];
List selectedServiceProvList = [];

final servicesProvidedList = [
  'Furniture Painting',
  'Building Painting',
  'Room Painting',
];
List selectedChargeRateList = [];

final expertiseList = [
  'Beginner (0 - 1 year)',
  'Amateur (1 - 3 years)',
  'Professional (3 - 6 years)',
  'Expert (6+ years)',
];
List selectedExpertiseList = [];

final momoListOptions = [
  'MTN Mobile Money',
  'Vodafone Cash',
  'Airtel/Tigo Money',
];
List selectedMomoOptions = [];

final chargePerList = ['N/A', 'Hour', '6 hours', '12 hours', 'Day'];
final regionsList = [
  'N/A',
  'Volta Region',
  'Greater Accra Region',
  'Central Region',
  'Western Region',
  'Eastern Region',
  'Savanna Region',
  'Ashanti Region',
  'Northern Region',
  'Upper-West Region',
  'North-East Region',
  'Bono-East Region',
  'Brong Ahafo Region',
  'Ahafo Region',
  'Oti Region',
  'Upper-East Region',
  'Northern Region',
];

String dropdownvalue = 'N/A';
List selectedServiceCatList = [];

int priceIndex = 0;

late String regionValue;

List addressStreetName = [];
List addressTownName = [];
List addressRegionName = [];
List addressHouseNum = [];
