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
Color semiGrey = Color(0xff808080);
Color complementaryRed = Color(0xffBD3A32);

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
  'N/A',
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

final userRoleList = [
  'Regular Customer',
  'Professional Handyman',
];
List<String> selectedMomoOptions = [];
List<String> selectedMomoOptionsIcons = [
  'assets/icons/mtn_momo.png',
  'assets/icons/vodafone_cash.png',
  'assets/icons/airtel_tigo.png',
];

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
];

final creditCardList = [
  'N/A',
  'MasterCard',
  'Visa Card',
  'American Express',
  'Discover Card',
];

String dropdownvalue = 'N/A';
String roleValue = 'Regular Customer';
List selectedServiceCatList = [];

int priceIndex = 0;

late String regionValue;

List addressStreetName = [];
List addressTownName = [];
List addressRegionName = [];
List addressHouseNum = [];

bool isJobAboutClicked = true;
bool isJobPortfolioClicked = false;

late String cardSelected = 'N/A';
late String roleSelected = 'Regular Customer';

bool isJobUpcomingClicked = true;
bool isJobOffersClicked = false;
bool isJobCompletedClicked = false;

final upcomingOrderStatusList = [
  'View Order',
  'Ongoing',
  'View Order',
  'View Order',
];
final upcomingNameList = [
  'Leo Messi',
  'Erling Halaand',
  'Cristiano Ronaldo',
  'Walter White'
];
final upcomingDateList = [
  '11-01-2023',
  '04-01-2023',
  '23-05-2023',
  '30-01-2023',
];
final upcomingTimeList = [
  '12:30 AM',
  '03:10 PM',
  '10:30 AM,',
  '05:00 PM',
];
final upcomingImageLocation = [
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
];
final upcomingServices = [
  'Painting',
  'Electrical Repair',
  'Building Renovation',
  'Furniture Painting',
];

final offerOrderStatusList = [
  'View Offer',
  'View Offer',
  'View Offer',
  'View Offer',
];
final offerNameList = [
  'Leo Messi',
  'Erling Halaand',
  'Cristiano Ronaldo',
  'Walter White'
];
final offerDateList = [
  '11-01-2023',
  '04-01-2023',
  '23-05-2023',
  '30-01-2023',
];
final offerTimeList = [
  '12:30 AM',
  '03:10 PM',
  '10:30 AM,',
  '05:00 PM',
];
final offerImageLocation = [
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
];
final offerServices = [
  'Painting',
  'Electrical Repair',
  'Building Renovation',
  'Furniture Painting',
];

final completedOrderStatusList = [
  'Cancelled',
  'Complete',
  'Cancelled',
  'Cancelled',
];
final completedNameList = [
  'Leo Messi',
  'Erling Halaand',
  'Cristiano Ronaldo',
  'Walter White'
];
final completedDateList = [
  '11-01-2023',
  '04-01-2023',
  '23-05-2023',
  '30-01-2023',
];
final completedTimeList = [
  '12:30 AM',
  '03:10 PM',
  '10:30 AM,',
  '05:00 PM',
];
final completedImageLocation = [
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
];
final completedServices = [
  'Painting',
  'Electrical Repair',
  'Building Renovation',
  'Furniture Painting',
];

bool isJobOfferScreen = false;
bool isRememberMeClicked = false;
bool isTermsAndCondAgreed = false;

List<String> generalSectionList = [
  'Account Information',
  'Address Information',
  'Payment Information',
  'Appearance',
  'Notification',
];

List<String> generalSectionIcons = [
  'user_icon',
  'location_icon',
  'wallet_icon',
  'settings_icon',
  'notification_icon',
];

List<String> supportSectionList = [
  'Change Language',
  'Report on Issue',
  'FAQ',
];

List<String> supportSectionIcons = [
  'world_icon',
  'danger_icon',
  'help_icon',
];

List<String> customerFavouritesImageList = [];
List<String> customerFavouritesNameList = [];
List<String> customerFavouritesPriceList = [];
List<String> customerFavouritesRatingList = [];
List<String> customerFavouritesJobTypeList = [];
//-----------------------------------------------------------
List<String> handymanFavouritesImageList = [];
List<String> handymanFavouritesNameList = [];
List<String> handymanFavouritesPriceList = [];
List<bool> handymanFavouritesStatusList = [];
List<String> handymanFavouritesJobTypeList = [];

late int handymanSelectedIndex;
late int jobSelectedIndex;

List<String> handymanDashboardJobType = [
  'Furniture Painting',
  'Building Renovations',
  'Playground Painting',
  'Painting',
  'Willow Painting',
];

List<String> handymanDashboardImage = [
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
];

List<String> handymanDashboardName = [
  'Harry Garret',
  'Kevin De Bruyne',
  'PJ Agrolics',
  'Ekow Armah',
  'Harry Garret',
];

List<String> handymanDashboardPrice = [
  '15/hr',
  '35/hr',
  '75/hr',
  '15/hr',
  '100/hr',
];

List<String> handymanDashboardRating = [
  '4.9',
  '2.5',
  '4.7',
  '4.3',
  '3.4',
];

//------------------------------------------------

List<String> jobDashboardJobType = [
  'Furniture Painting asd asds asd asd',
  'Building Renovations',
  'Playground Painting',
  'Painting',
  'Willow Painting',
];

List<String> jobDashboardImage = [
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
];

List<String> jobDashboardName = [
  'Harry Garret',
  'Kevin De Bruyne',
  'PJ Agrolics',
  'Ekow Armah',
  'Harry Garret',
];

List<String> jobDashboardPrice = [
  '15/hr',
  '35/hr',
  '75/hr',
  '15/hr',
  '100/hr',
];

//------------------------------------------

List<String> cardLogo = [
  'assets/icons/visa_logo.png',
  'assets/icons/visa_logo.png',
  'assets/icons/visa_logo.png',
  'assets/icons/visa_logo.png',
  'assets/icons/visa_logo.png',
];

List<String> cardName = [
  'PJ Agrolics',
  'PJ Agrolics',
  'PJ Agrolics',
];

List<String> cardNumber = [
  '**** **** **** 4765',
  '**** **** **** 4765',
  '**** **** **** 4765',
];

List<String> cardExpiryDate = [
  '**/**',
  '**/**',
  '**/**',
];

List<String> historyPicList = [
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
  'assets/images/profile_pic.jpeg',
];

List<String> historyNameList = [
  'Harry Garret',
  'Harry Garret',
  'Harry Garret',
  'Harry Garret',
  'Harry Garret',
];

List<String> historyJobTypeList = [
  'Plumbing',
  'Plumbing',
  'Plumbing',
  'Plumbing',
  'Plumbing',
];

List<String> historyDateList = [
  '22-10-23 || 09:30 PM',
  '22-10-23 || 09:30 PM',
  '22-10-23 || 09:30 PM',
  '22-10-23 || 09:30 PM',
  '22-10-23 || 09:30 PM',
];

List<String> historyPriceList = [
  '15',
  '15',
  '15',
  '15',
  '15',
];

bool loginTextFieldError = false;
bool forgotPasswordEmailError = false;
bool registerFirstNameError = false;
bool registerLastNameError = false;
bool registerEmailError = false;
bool registerPasswordError = false;
bool registerNumberError = false;

int activeIndex = 0;

bool isPersonalInfoReadOnly = true;
bool isPaymentInfoReadOnly = true;
bool isLocationReadOnly = true;

String? cardNumberHintText = '';
String? expiryDateHintText = '';
String? cvvHintText = '';
String? payPalHintText = '';
