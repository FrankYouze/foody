import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
   
  final String foodName;
  final String price;
 // final Function ()? AdminServ;
  final Function ()? ClientRemov;
  final String userGroup;
  const OrderItem({super.key, required this.foodName, required this.price, required this.ClientRemov, required this.userGroup});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
      
      title: Text(foodName),
      leading: Text(price),
      trailing: MaterialButton(onPressed: ClientRemov,color: Colors.black,child: Text("REMOVE",style:TextStyle(color: Colors.white)),),
        
      ),
    );
  }
}