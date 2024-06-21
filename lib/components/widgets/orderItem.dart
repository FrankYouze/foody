import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
   
  final String foodName;
  final String price;
  final Function ()? AdminServ;
  final Function ()? ClientRemov;
  final String userGroup;
  const OrderItem({super.key, required this.foodName, required this.price, this.AdminServ, this.ClientRemov, required this.userGroup});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
      
      title: Text("Food Name"),
      trailing: Column(
        children: [
      MaterialButton(onPressed: (){},color: Colors.black,child: Text("REMOVE",style:TextStyle(color: Colors.white)),),
        ],
      ),
      ),
    );
  }
}