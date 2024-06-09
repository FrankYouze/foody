import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foody/components/client_drinks.dart';
import 'package:foody/components/client_food.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
      final DatabaseReference foodsDB =
        FirebaseDatabase.instance.ref().child("AddedFoods");
    final DatabaseReference drinksDB =
        FirebaseDatabase.instance.ref().child("AddedDrinks");
  String list = "";
  Map<dynamic, dynamic> availableFoods = {};

  @override
  void initState() {
    // TODO: implement initState
    
    foodsDB.onValue.listen((event) {
      setState(() {
        // print("hellw world");
        availableFoods = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
        print(availableFoods.keys);
      
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("CafeApp",style: TextStyle(color: Colors.white),),
        iconTheme:IconThemeData(color: Colors.white),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))],
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
                    child: TextButton(onPressed: (){
                      setState(() {
                        list = "FOOD";
                      });
                    }, child: Text("FOOD",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),)),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    color: Colors.white,
                     child: TextButton(onPressed: (){
                      setState(() {
                        list = "DRINKS";
                      });
                     }, child: Text("DRINKS",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20))
                     )
                  ),
                ))
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: list == "DRINKS"? ClientDrinks() : ClientFood(),
            ),
          )
        ],
      ),
    );
  }
}
