import 'package:flutter/material.dart';

class ClientDrinks extends StatefulWidget {
  const ClientDrinks({super.key});

  @override
  State<ClientDrinks> createState() => _ClientDrinksState();
}

class _ClientDrinksState extends State<ClientDrinks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("DRINKS"),),
    );
  }
}