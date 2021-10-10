import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'addNewReview.dart';

class onboardingScreen extends StatefulWidget {
  static const BOARDING_SCREEN = 'onbording_scrren';
  @override
  _onboardingScreenState createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {
  var boardcontroller = PageController();
  bool isLastPage = false;

  List<String> boarding = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
  ];
  Future<void> submit() async {
    SharedPreferences preferences;
    preferences = await SharedPreferences.getInstance();
    var value = await preferences.setBool('onboarding', true);
    if (value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => addNewReview()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardcontroller,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLastPage = true;
                    });
                  } else {
                    isLastPage = false;
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index], index),
                itemCount: boarding.length,
              ),
            ),
            /*SizedBox(
              height: 40.0,
            ),*/
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(String image, int index) => index == 0
      ? Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(image),
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
                                if (isLastPage) {
                                  submit();
                                } else {
                                  boardcontroller.nextPage(
                                      duration: Duration(milliseconds: 750),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                }
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
        )
      : index == 1
          ? Stack(
              children: [
                Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage(image),
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
                          if (isLastPage) {
                            submit();
                          } else {
                            boardcontroller.nextPage(
                                duration: Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
                          }
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
                          SmoothPageIndicator(
                            controller: boardcontroller,
                            count: boarding.length,
                            effect: ExpandingDotsEffect(
                              dotColor: Colors.grey,
                              dotHeight: 10,
                              dotWidth: 10,
                              spacing: 5.0,
                              expansionFactor: 4,
                              activeDotColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : index == 2 || index == 3
              ? Stack(
                  children: [
                    Container(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage(image),
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
                              if (isLastPage) {
                                submit();
                              } else {
                                boardcontroller.nextPage(
                                    duration: Duration(milliseconds: 750),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              }
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
                              SmoothPageIndicator(
                                controller: boardcontroller,
                                count: boarding.length,
                                effect: ExpandingDotsEffect(
                                  dotColor: Colors.grey,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  spacing: 5.0,
                                  expansionFactor: 4,
                                  activeDotColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Container(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage(image),
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
                              if (isLastPage) {
                                submit();
                              } else {
                                boardcontroller.nextPage(
                                    duration: Duration(milliseconds: 750),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              }
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
                              SmoothPageIndicator(
                                controller: boardcontroller,
                                count: boarding.length,
                                effect: ExpandingDotsEffect(
                                  dotColor: Colors.grey,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  spacing: 5.0,
                                  expansionFactor: 4,
                                  activeDotColor:
                                      Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
}
