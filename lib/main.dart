import 'package:flutter/material.dart';
import 'package:flutter_app_test/providers/Reviews_provider.dart';
import 'package:flutter_app_test/providers/customerprovider.dart';
import 'package:flutter_app_test/screens/addNewReview.dart';
import 'package:flutter_app_test/screens/profile.dart';
import 'package:flutter_app_test/screens/reviews.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        home: Portfilo(),
      ),
    );
  }
}

/*
* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
* */
