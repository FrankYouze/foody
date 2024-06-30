import 'package:flutter/material.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        color: Colors.white,
        height: 50,
        width: 300,
        child: Center(child: Text("ORDER PLACED SUCCESSFULY",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}