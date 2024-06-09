import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foody/components/widgets/foodItem.dart';

class ClientDrinks extends StatefulWidget {
  final String User;
  const ClientDrinks({super.key, required this.User});

  @override
  State<ClientDrinks> createState() => _ClientDrinksState();
}

class _ClientDrinksState extends State<ClientDrinks> {
  final DatabaseReference drinksDB =
      FirebaseDatabase.instance.ref().child("AddedDrinks");

  Map<dynamic, dynamic> availableDrinks = {};
  Map<String, dynamic> food = {};
  dynamic current;
  String userGroup = "";

  @override
  void initState() {
    // TODO: implement initState

    drinksDB.onValue.listen((event) {
      setState(() {
        // print("hellw world");
        availableDrinks = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
            userGroup = widget.User;
        //  print(availableDrinks.keys);

       // print(availableDrinks[current]['FoodImage']);

        // print(availableFoods[current]["FoodImage"]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: availableDrinks == null? Center(child: Text("No item to show"),):ListView.builder(
            itemCount: availableDrinks.length,
            itemBuilder: (context, i) {
              current = availableDrinks.keys.elementAt(i);
              return FoodItem(
                  ImageUrl: availableDrinks[current]['FoodImage'],
                  foodName: availableDrinks.keys.elementAt(i),
                  price: availableDrinks[current]['FoodPrice'], userGroup: userGroup,);
            }),
      ),
    );
  }
}
