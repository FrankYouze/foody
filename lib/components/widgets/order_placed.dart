import 'package:flutter/material.dart';

class OrderPlaced extends StatelessWidget {
  final String confirm;
  const OrderPlaced({super.key, required this.confirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        color: Colors.white,
        height: 50,
        width: 300,
        child: Center(child: Text(confirm,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}