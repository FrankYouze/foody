import 'package:flutter/material.dart';
import 'package:foody/components/client_drinks.dart';
import 'package:foody/components/client_food.dart';
import 'package:foody/pages/Pass_conPage.dart';
import 'package:foody/pages/client_cart.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  //     final DatabaseReference foodsDB =
  //       FirebaseDatabase.instance.ref().child("AddedFoods");
  //   final DatabaseReference drinksDB =
  //       FirebaseDatabase.instance.ref().child("AddedDrinks");
  String list = "";
  String _userGroup = "";
  // Map<dynamic, dynamic> availableFoods = {};

  // @override
  // void initState() {
  //   // TODO: implement initState

  //   foodsDB.onValue.listen((event) {
  //     setState(() {
  //       // print("hellw world");
  //       availableFoods = Map<String, dynamic>.from(
  //           event.snapshot.value as Map<dynamic, dynamic>);
  //       print(availableFoods.keys);

  //     });
  //   });

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "CafeApp",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          }, icon: Icon(Icons.shopping_cart)),
           IconButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PassConpage()),
            );
          }, icon: Icon(Icons.security)),
          
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    color: Colors.white,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            list = "FOOD";
                          });
                        },
                        child: Text(
                          "FOOD",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      color: Colors.white,
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              list = "DRINKS";
                            });
                          },
                          child: Text("DRINKS",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)))),
                ))
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: list == "DRINKS" ? ClientDrinks(user: _userGroup,) : ClientFood(user: _userGroup,),
            ),
          )
        ],
      ),
    );
  }
}
