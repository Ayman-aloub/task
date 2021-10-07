import 'package:flutter/material.dart';
import 'package:flutter_app_test/providers/customerprovider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_test/models/review.dart';
import 'package:flutter_app_test/providers/Reviews_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class addNewReview extends StatefulWidget {
  @override
  State<addNewReview> createState() => _addNewReviewState();
}

class _addNewReviewState extends State<addNewReview> {
  double rate = 1;

  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Center(
            child: Text(
              'My review',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              //_textController.dispose();
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'how was your experience with',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Beautifull people',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RatingBar.builder(
                  minRating: 1,
                  initialRating: 1,
                  itemSize: 18.0,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                  ),
                  onRatingUpdate: (rating) {
                    rate = rating;
                    //print(rating);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'please enter your comment.....',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      )),
                  controller: _textController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3.0, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      print(rate);
                      Provider.of<Reviews_provider>(context, listen: false)
                          .addNewReview(Review(
                              rate: rate,
                              comment: _textController.text,
                              date: DateTime.now(),
                              name: Provider.of<Customer_provider>(context)
                                  .customer!
                                  .name,
                              imageUrl: Provider.of<Customer_provider>(context)
                                  .customer!
                                  .imageUrl));
                      Navigator.of(context).pop();

                      //_textController.dispose();
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Review guideLines',
                style: TextStyle(fontSize: 15.0),
              )),
          elevation: 0,
        ),
      ),
    );
  }
}
