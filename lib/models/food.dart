import 'package:flutter/material.dart';

class Food {
  final String FoodName;
  final String FoodPrice;
  final String FoodImage;

  Food({required this.FoodName,required this.FoodPrice,required this.FoodImage, });

    @override
  String toString() {
    return '{name: $FoodName,price: $FoodPrice, image: $FoodImage}';
  }
}
