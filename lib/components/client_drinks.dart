import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foody/components/widgets/foodItem.dart';
import 'package:foody/models/cartItem.dart';
import 'package:foody/models/food.dart';
import 'package:provider/provider.dart';

class ClientDrinks extends StatefulWidget {
  final String user;
  const ClientDrinks({super.key, required this.user});

  @override
  State<ClientDrinks> createState() => _ClientDrinksState();
}

class _ClientDrinksState extends State<ClientDrinks> {
  final DatabaseReference drinksDB =
      FirebaseDatabase.instance.ref().child("AddedDrinks");
  final DatabaseReference orderdListDB =
      FirebaseDatabase.instance.ref().child("OrderList");

  Map<dynamic, dynamic> availableDrinks = {};
  Map<String, dynamic> food = {};
  dynamic current;
  String userGroup = "";
  List<Food> drinksList = [];

  @override
  void initState() {
    // TODO: implement initState

    drinksDB.onValue.listen((event) {
      setState(() {
        // print("hellw world");
        availableDrinks = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
        userGroup = widget.user;
        //  print(availableDrinks.keys);

        // print(availableDrinks[current]['FoodImage']);

              drinksList = availableDrinks.entries.map((entry) {
  return Food(
    FoodName: entry.key,
    FoodPrice: entry.value['FoodPrice'],
    FoodImage: entry.value['FoodImage'],
  );
}).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: availableDrinks == null
            ? Center(
                child: Text("No item to show"),
              )
            : ListView.builder(
                itemCount: availableDrinks.length,
                itemBuilder: (context, i) {
                  current = availableDrinks.keys.elementAt(i);
                  return FoodItem(
                    ImageUrl: availableDrinks[current]['FoodImage'],
                    foodName: availableDrinks.keys.elementAt(i),
                    price: availableDrinks[current]['FoodPrice'],
                    userGroup: userGroup,
                    ClientOrd: () async {
                     
                       context.read<Cart>()
                          .addToCart(drinksList[i]);
                        //  print(foodList[index].FoodImage);

                         // print(availableDrinks[current]);
                    },
                    AdminRem: () async {
                      drinksDB
                          .child(availableDrinks.keys.elementAt(i))
                          .remove();
                    },
                  );
                }),
      ),
    );
  }
}
