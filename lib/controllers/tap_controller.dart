import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TapController extends GetxController {
  int _quantity = 0;

  int get quantity => _quantity;
  int _intRecyItem=0;
  int get intRecyItem => _intRecyItem;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity= checkQuantity(_quantity+1);
    } else {
      _quantity = checkQuantity(_quantity- 1);
    }
    update();
  }
  int getQuantity(){
    return _quantity;
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 1000) {
      Get.snackbar("Item count", "You can't add more !",
        colorText: Colors.white,
      );
      return 1000;
    } else {
      return quantity;
    }
  }
  void initProduct(){
    _quantity=0;
  }
}
