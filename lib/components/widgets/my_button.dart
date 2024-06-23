import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
final Function()? onTap;
final String text;

  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
    onTap: onTap,child: 
     Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(color: Colors.grey[700],borderRadius: BorderRadius.circular(50)),
      child:  Center(
        child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
        
      ),
      ),
    ),);
  }
}