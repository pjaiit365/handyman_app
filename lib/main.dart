import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:handyman_app/Screens/Splash/splash_screen.dart';
import 'package:handyman_app/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PaystackPlugin().initialize(
      publicKey: 'pk_test_caf898bc3a14e3b6c7bd997dd1828c8469726c63');

  await Firebase.initializeApp();

  final result = PaystackPlugin().sdkInitialized;
  print(result);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of HomeCareX Mobile Application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handyman Service App',
      home: const SplashScreen(),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
        datePickerTheme: DatePickerThemeData(
          headerBackgroundColor: primary,
        ),
        // timePickerTheme: TimePickerThemeData(),
        appBarTheme: AppBarTheme(
          color: white,
          elevation: 0.0,
        ),
        fontFamily: 'Inter',
        backgroundColor: white,
      ),
    );
  }
}
