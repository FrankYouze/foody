import 'package:flutter/material.dart';
import 'package:foody/components/client_drinks.dart';
import 'package:foody/components/client_food.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SOME TEXT"),backgroundColor: Colors.grey,),
      body: SafeArea(
      
        child: Row(
          children: [Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
              color: Colors.grey,
              child:ClientFood(user: "Admin") ),
          )),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
                color: Colors.grey,
              child: ClientDrinks(user: "Admin")),
          )),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
                color: Colors.grey,
              child: Text("ALL IN ALL")),
          ))
          
          ],
        ),
      ),
    );
  }
}