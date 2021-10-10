import 'package:flutter/material.dart';
import 'package:flutter_app_test/providers/Reviews_provider.dart';
import 'package:flutter_app_test/providers/customerprovider.dart';
import 'package:flutter_app_test/screens/addNewReview.dart';
import 'package:flutter_app_test/screens/onboardingScreen.dart';
import 'package:flutter_app_test/screens/profile.dart';
import 'package:flutter_app_test/screens/reviews.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late bool isonboarding;
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool value = await prefs.getBool('onboarding') ?? false;
  if (value == false) {
    isonboarding = true;
  } else {
    isonboarding = false;
  }

  runApp(MyApp(onboarding: isonboarding));
}

class MyApp extends StatelessWidget {
  late bool onboarding;
  MyApp({Key? key, required this.onboarding}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Reviews_provider()),
        ChangeNotifierProvider.value(value: Customer_provider()..addCustomer()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: onboarding ? onboardingScreen() : Reviews_screen(),
      ),
    );
  }
}
