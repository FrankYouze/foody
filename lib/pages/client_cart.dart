import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(backgroundColor: Colors.green,title: Text("MyCart",style: TextStyle(color: Colors.white),), centerTitle: true,),

      body: ListView(children: [Center(child:Text("CLIENT CART"))],),
    );
  }
}