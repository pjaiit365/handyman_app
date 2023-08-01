import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:handyman_app/Screens/Splash/splash_screen.dart';
import 'package:handyman_app/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PaystackPlugin().initialize(
      publicKey: 'pk_test_73214e01e7d0c003d3e42b6a448400ab54eedb20');
  var result = PaystackPlugin().sdkInitialized;
  print(result);

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    try {
      PaystackPlugin().initialize(
          publicKey: 'pk_test_caf898bc3a14e3b6c7bd997dd1828c8469726c63');
    } on PaystackSdkNotInitializedException catch (e) {
      print(e.toString());
    } catch (err) {
      print(err.toString());
    }
    final result = PaystackPlugin().sdkInitialized;
    print(result);
    super.initState();
  }

  // This widget is the root of HomeCareX Mobile Application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeCareX',
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
