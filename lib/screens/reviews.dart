import 'package:flutter/material.dart';
import 'package:flutter_app_test/providers/Reviews_provider.dart';
import 'package:flutter_app_test/screens/addNewReview.dart';
import 'package:flutter_app_test/widgets/singleReview.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app_test/models/review.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class Reviews_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Center(
            child: Text(
              ' Reviews',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints sizes) =>
              OrientationBuilder(
                  builder: (context, orientation) =>
                      orientation == Orientation.landscape ||
                              sizes.maxWidth > 1200
                          ? landscpe_case(context, sizes)
                          : portrait_case(context, sizes)),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              //padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 3.0, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => addNewReview()));
                },
                child: Text(
                  'Write review',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  Padding portrait_case(BuildContext context, BoxConstraints sizes) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              //height: 128.0,
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${Provider.of<Reviews_provider>(context).appReview}',
                        style: TextStyle(
                            fontSize: 20,
                            //color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300),
                      ),
                      RatingBarIndicator(
                        rating: Provider.of<Reviews_provider>(context)
                            .appReview
                            .toDouble(),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                        ),
                        itemCount: 5,
                        itemSize: sizes.maxWidth > 750.0 ? 30.0 : 25.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildRow(
                            context,
                            5,
                            Provider.of<Reviews_provider>(
                              context,
                            ).countReviwsfive.toString()),
                        buildRow(
                            context,
                            4,
                            Provider.of<Reviews_provider>(
                              context,
                            ).countReviwsfour.toString()),
                        buildRow(
                            context,
                            3,
                            Provider.of<Reviews_provider>(
                              context,
                            ).countReviwsThree.toString()),
                        buildRow(
                            context,
                            2,
                            Provider.of<Reviews_provider>(
                              context,
                            ).countReviwsTwo.toString()),
                        buildRow(
                            context,
                            1,
                            Provider.of<Reviews_provider>(
                              context,
                            ).countReviwsOne.toString()),
                      ],
                    ),
                  )),
                ],
              )),
          Expanded(
            flex: 3,
            child: Provider.of<Reviews_provider>(context).reviews.length != 0
                ? GridView.builder(
                    //shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 1),
                    itemBuilder: (_, index) => buildSingleReview(context,
                        Provider.of<Reviews_provider>(context).reviews[index]),
                    itemCount:
                        Provider.of<Reviews_provider>(context).reviews.length,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Padding landscpe_case(BuildContext context, BoxConstraints sizes) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              //height: 128.0,
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${Provider.of<Reviews_provider>(context).appReview}',
                        style: TextStyle(
                            fontSize: 20,
                            //color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300),
                      ),
                      RatingBarIndicator(
                        rating: Provider.of<Reviews_provider>(context)
                            .appReview
                            .toDouble(),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                        ),
                        itemCount: 5,
                        itemSize: sizes.maxWidth > 750.0 ? 30.0 : 25.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildRow(
                            context,
                            5,
                            Provider.of<Reviews_provider>(
                              context,
                            ).countReviwsfive.toString()),
                        buildRow(
                            context,
                            4,
                            Provider.of<Reviews_provider>(
                              context,
                            ).countReviwsfour.toString()),
                        buildRow(
                            context,
                            3,
                            Provider.of<Reviews_provider>(
                              context,
                            ).countReviwsThree.toString()),
                        buildRow(
                            context,
                            2,
                            Provider.of<Reviews_provider>(
                              context,
                            ).countReviwsTwo.toString()),
                        buildRow(
                            context,
                            1,
                            Provider.of<Reviews_provider>(
                              context,
                            ).countReviwsOne.toString()),
                      ],
                    ),
                  )),
                ],
              )),
          Expanded(
            flex: 3,
            child: Provider.of<Reviews_provider>(context).reviews.length != 0
                ? GridView.builder(
                    //shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 4.0,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 1),
                    itemBuilder: (_, index) => buildSingleReview(context,
                        Provider.of<Reviews_provider>(context).reviews[index]),
                    itemCount:
                        Provider.of<Reviews_provider>(context).reviews.length,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget buildRow(BuildContext context, int id, String count) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, BoxConstraints sizes) => Row(
            children: [
              Text(
                id.toString(),
                style: TextStyle(
                  fontSize: sizes.maxWidth > 750 ? 17 : 11,
                ),
              ),
              Icon(
                Icons.star,
                color: Theme.of(context).primaryColor,
                size: sizes.maxWidth > 750 ? 17 : 11.0,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: sizes.maxWidth > 750 ? 130 : 80,
                height: 0.0,
                decoration: BoxDecoration(
                    border: Border.all(width: id * 0.1, color: Colors.black54)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                count,
                style: TextStyle(
                    fontSize: sizes.maxWidth > 750 ? 17 : 11,
                    color: Colors.black54),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.0),
      ],
    );
  }
}
