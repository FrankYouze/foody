import 'package:flutter/material.dart';
import 'package:foody/components/widgets/foodItem.dart';

class ClientFood extends StatefulWidget {
  const ClientFood({super.key});

  @override
  State<ClientFood> createState() => _ClientFoodState();
}

class _ClientFoodState extends State<ClientFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [FoodItem(), FoodItem(),
      FoodItem(), FoodItem(),
      FoodItem(), FoodItem(),
      FoodItem(), FoodItem(),
      FoodItem(), FoodItem(),
      
      ]),
    );
  }
}
