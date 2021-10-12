import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:page_transition/page_transition.dart';

import 'addNewReview.dart';

List<String> boarding = [
  'assets/1.jpg',
  'assets/2.jpg',
  'assets/3.jpg',
  'assets/4.jpg',
  'assets/5.jpg'
];

var pageTransitionType = PageTransitionType.rotate;
var duration = Duration(seconds: 2);
var alignment = Alignment.bottomCenter;
var curve = Curves.ease;

class boardingScreen extends StatelessWidget {
  const boardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(boarding[0]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(),
                  flex: 3,
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, top: 10, right: 50.0, bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'your preferred language',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'English',
                                      style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: 60,
                                      height: 0.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.1, color: Colors.white)),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'مرحبا',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        height: 0.3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'العربيه',
                                      style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: 60,
                                      height: 0.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.1, color: Colors.white)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                                minimumSize: Size(110, 40),
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        duration: duration,
                                        type: pageTransitionType,
                                        alignment: alignment,
                                        curve: curve,
                                        child: SecondScreen()));
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    color: Colors.deepPurple[900],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(boarding[1]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 50.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(110, 40),
                      primary: Colors.deepPurple[900],
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              duration: duration,
                              type: pageTransitionType,
                              alignment: alignment,
                              curve: curve,
                              child: ThirdScreen()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: boardingScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: ThirdScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: FouthScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: LastScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(boarding[2]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 50.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(110, 40),
                      primary: Colors.deepPurple[900],
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              duration: duration,
                              type: pageTransitionType,
                              alignment: alignment,
                              curve: curve,
                              child: FouthScreen()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: boardingScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: SecondScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: FouthScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: LastScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FouthScreen extends StatelessWidget {
  FouthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(boarding[3]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 50.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(110, 40),
                      primary: Colors.deepPurple[900],
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              duration: duration,
                              type: pageTransitionType,
                              alignment: alignment,
                              curve: curve,
                              child: LastScreen()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: boardingScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: SecondScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: ThirdScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: LastScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LastScreen extends StatelessWidget {
  LastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(boarding[4]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 50.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(110, 40),
                      primary: Colors.deepPurple[900],
                    ),
                    onPressed: () {
                      submit(context);
                    },
                    child: Text(
                      'Lets Go',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: boardingScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: SecondScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: ThirdScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: duration,
                                  type: pageTransitionType,
                                  alignment: alignment,
                                  curve: curve,
                                  child: FouthScreen()));
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(),
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submit(BuildContext context) async {
    SharedPreferences preferences;
    preferences = await SharedPreferences.getInstance();
    var value = await preferences.setBool('onboarding', true);
    if (value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => addNewReview()));
    }
  }
}
