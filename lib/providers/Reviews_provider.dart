import 'package:flutter/cupertino.dart';
import 'package:flutter_app_test/models/review.dart';

class Reviews_provider with ChangeNotifier {
  List<Review> reviews = [];
  int countReviwsOne = 0;
  int countReviwsTwo = 0;
  int countReviwsThree = 0;
  int countReviwsfour = 0;
  int countReviwsfive = 0;
  int appReview = 0;

  void addNewReview(Review newRewiew) {
    reviews.add(newRewiew);
    updateAppReview(newRewiew);

    notifyListeners();
  }

  void CalculateAppReview() {
    reviews.map((e) {
      if (e.rate == 1.0) {
        countReviwsOne++;
      } else if (e.rate == 2.0) {
        countReviwsTwo++;
      } else if (e.rate == 3.0) {
        countReviwsThree++;
      } else if (e.rate == 4.0) {
        countReviwsfour++;
      } else if (e.rate == 5.0) {
        countReviwsfive++;
      }
    });
    appReview = ((countReviwsOne * 1 +
                countReviwsTwo * 2 +
                countReviwsThree * 3 +
                countReviwsfour * 4 +
                countReviwsfive * 5) /
            (countReviwsOne +
                countReviwsTwo +
                countReviwsThree +
                countReviwsfour +
                countReviwsfive) *
            5)
        .toInt();
    notifyListeners();
  }

  void updateAppReview(Review newReview) {
    if (newReview.rate == 1.0) {
      countReviwsOne++;
    } else if (newReview.rate == 2.0) {
      countReviwsTwo++;
    } else if (newReview.rate == 3.0) {
      countReviwsThree++;
    } else if (newReview.rate == 4.0) {
      countReviwsfour++;
    } else if (newReview.rate == 5.0) {
      countReviwsfive++;
    }

    appReview = (((countReviwsOne * 1 +
                    countReviwsTwo * 2 +
                    countReviwsThree * 3 +
                    countReviwsfour * 4 +
                    countReviwsfive * 5) /
                (reviews.length * 5)) *
            5)
        .toInt();
    notifyListeners();
  }
}
