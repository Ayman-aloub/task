import 'package:flutter/material.dart';
import 'package:flutter_app_test/providers/Reviews_provider.dart';
import 'package:flutter_app_test/screens/addNewReview.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Reviews_screen(),
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
