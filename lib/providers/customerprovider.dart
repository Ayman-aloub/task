import 'package:flutter/cupertino.dart';
import 'package:flutter_app_test/models/customerInfo.dart';
import 'package:image_picker/image_picker.dart';

class Customer_provider with ChangeNotifier {
  Customer? customer;

  void addCustomer() {
    /*load from server */
    customer = Customer(
        name: 'Ahmed Mohammed Ali',
        phone: '01141366366',
        imageUrl: 'http://via.placeholder.com/350x150');

    notifyListeners();
  }

  void updateImage(XFile image) {
    /*upload image in server and get new url*/

    notifyListeners();
  }

  void updatePhone(String newphone) {
    /*update in server*/
    customer!.phone = newphone;

    notifyListeners();
  }

  void updateName(String newName) {
    /*update in server*/
    customer!.name = newName;

    notifyListeners();
  }
}
