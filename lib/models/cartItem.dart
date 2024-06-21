import 'package:flutter/material.dart';
import 'package:foody/models/food.dart';

class Cart extends ChangeNotifier{

  
  // List of Products in Cart
  List<Food> _cart = [];

  // List of Products in Wishlist
 

  // Get shop list
 // List<Product> get shop => _shop;

  // Get cart list
  List<Food> get cart => _cart;

  // Get wishlist
 // List<Product> get wishlist => _wishlist;

  // Add item to cart
  void addToCart(Food item) {
    _cart.add(item);
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(Food item) {
    _cart.remove(item);
    notifyListeners();
  }

  // // Add item to wishlist
  // void addToWishlist(Product item) {
  //   _wishlist.add(item);
  //   notifyListeners();
  // }

  // Remove item from wishlist
  // void removeFromWishlist(Product item) {
  //   _wishlist.remove(item);
  //   notifyListeners();
  // }
}