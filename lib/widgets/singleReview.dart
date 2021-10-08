import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_app_test/models/review.dart';
import 'package:intl/intl.dart';

class SingleReview extends StatelessWidget {
  final double rate;
  final String comment;
  final String name;
  final String imageUrl;
  final DateTime date;
  const SingleReview(
      {Key? key,
      required this.comment,
      required this.name,
      required this.rate,
      required this.date,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      imageUrl,
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
                        name,
                        style: TextStyle(fontSize: 15.0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBarIndicator(
                            rating: rate,
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
                          Text(rate.toString()),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMd().format(date).toString()),
                    ],
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  comment,
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
}
