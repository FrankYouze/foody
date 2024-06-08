import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        
        color: Colors.green,
        ),
      ),
    );
  }
}