import 'package:flutter/material.dart';
import 'package:flutter_app_test/providers/Reviews_provider.dart';
import 'package:flutter_app_test/screens/addNewReview.dart';
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
              style: TextStyle(color: Colors.black),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                  height: 128.0,
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
                            itemSize: 25.0,
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
                child: Provider.of<Reviews_provider>(context).reviews.length !=
                        0
                    ? GridView.builder(
                        //shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2.8,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 1),
                        itemBuilder: (_, index) => buildSingleReview(
                            context,
                            Provider.of<Reviews_provider>(context)
                                .reviews[index]),
                        itemCount: Provider.of<Reviews_provider>(context)
                            .reviews
                            .length,
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
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

  Widget buildSingleReview(BuildContext context, Review review) {
    return Container(
      height: 130.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      review.imageUrl,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.name,
                        style: TextStyle(fontSize: 15.0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBarIndicator(
                            rating: review.rate,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                            ),
                            itemCount: 5,
                            itemSize: 15.0,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(review.rate.toString()),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMd().format(review.date).toString()),
                    ],
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  review.comment,
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.0, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context, int id, String count) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              id.toString(),
              style: TextStyle(
                fontSize: 11,
              ),
            ),
            Icon(
              Icons.star,
              color: Theme.of(context).primaryColor,
              size: 11.0,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 80,
              height: 0.0,
              decoration: BoxDecoration(
                  border: Border.all(width: id * 0.1, color: Colors.black54)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              count,
              style: TextStyle(fontSize: 11, color: Colors.black54),
            ),
          ],
        ),
        SizedBox(height: 5.0),
      ],
    );
  }
}
