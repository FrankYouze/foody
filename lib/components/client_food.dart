import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foody/components/order_list.dart';
import 'package:foody/components/widgets/foodItem.dart';
import 'package:foody/models/cartItem.dart';
import 'package:foody/models/food.dart';
import 'package:provider/provider.dart';

class ClientFood extends StatefulWidget {
  final String user;
  const ClientFood({super.key, required this.user});

  @override
  State<ClientFood> createState() => _ClientFoodState();
}

class _ClientFoodState extends State<ClientFood> {
  final DatabaseReference foodsDB =
      FirebaseDatabase.instance.ref().child("AddedFoods");
  final DatabaseReference drinksDB =
      FirebaseDatabase.instance.ref().child("AddedDrinks");
  final DatabaseReference orderdListDB =
      FirebaseDatabase.instance.ref().child("OrderList");
  final FirebaseAuth auth = FirebaseAuth.instance;

  Map<dynamic, dynamic> availableFoods = {};
  // Map<dynamic, dynamic> availableDrinks = {};
  Map<String, dynamic> food = {};
  dynamic current;
  String userGroup = "";
  List <Food> foodList = [];


  @override
  void initState() {
    // TODO: implement initState

    foodsDB.onValue.listen((event) {
      setState(() {
        // print("hellw world");
        availableFoods = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
      foodList = availableFoods.entries.map((entry) {
  return Food(
    FoodName: entry.key,
    FoodPrice: entry.value['FoodPrice'],
    FoodImage: entry.value['FoodImage'],
  );
}).toList();

        userGroup = widget.user;
        // print(availableFoods[current]["FoodImage"]);
      });
    });

    //  drinksDB.onValue.listen((event) {
    //   setState(() {
    //     // print("hellw world");
    //     availableDrinks = Map<String, dynamic>.from(
    //         event.snapshot.value as Map<dynamic, dynamic>);
    //     print(availableDrinks.keys);

    //     // print(availableFoods[current]["FoodImage"]);
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: availableFoods == null
          ? Center(
              child: Text("No item to show"),
            )
          : ListView.builder(
              itemCount: availableFoods.length,
              itemBuilder: (context, index) {
                current = availableFoods.keys.elementAt(index);
                //print(availableFoods[current]['FoodImage']);

                return FoodItem(
                  ImageUrl: availableFoods[current]['FoodImage'],
                  foodName: availableFoods.keys.elementAt(index),
                  price: availableFoods[current]['FoodPrice'],
                  userGroup: userGroup,
                  ClientOrd: () async {
        

                 context.read<Cart>()
                          .addToCart(foodList[index]);
                       //   print(foodList[index].FoodImage);

                  },
                  AdminRem: () async {
                    foodsDB
                        .child(availableFoods.keys.elementAt(index))
                        .remove();
                  },
                );
              }),
    );
  }
}
