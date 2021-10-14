import 'package:flutter/material.dart';
import 'package:flutter_app_test/providers/Reviews_provider.dart';
import 'package:flutter_app_test/providers/customerprovider.dart';
import 'package:flutter_app_test/screens/addNewReview.dart';
import 'package:flutter_app_test/screens/onboardingScreen.dart';
import 'package:flutter_app_test/screens/profile.dart';
import 'package:flutter_app_test/screens/reviews.dart';
import 'package:flutter_app_test/screens/splashScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //late bool onboarding;
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isonboarding;
  bool? isLoadind = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 9), () {
// Here you can write your code

      setState(() {
        isLoadind = false;
      });
    });
    SharedPreferences.getInstance().then((value) {
      bool x = value.getBool('onboarding') ?? false;
      if (x == false) {
        setState(() {
          isonboarding = true;
        });
      } else {
        setState(() {
          isonboarding = false;
        });
      }
    });
  }

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
        home: (isonboarding != null && isLoadind == false)
            ? (isonboarding! ? boardingScreen() : Reviews_screen())
            : SplashScreen(),
      ),
    );
  }
}
