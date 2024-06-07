import 'package:flutter/material.dart';

class ClientFood extends StatefulWidget {
  const ClientFood({super.key});

  @override
  State<ClientFood> createState() => _ClientFoodState();
}

class _ClientFoodState extends State<ClientFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("FOOD"),),
    );
  }
}