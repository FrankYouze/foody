import 'package:flutter/material.dart';
import 'package:foody/pages/admin_page.dart';

class FoodItem extends StatelessWidget {
  final String ImageUrl;
  final String foodName;
  final String price;
  final String userGroup;
   FoodItem({super.key, required this.ImageUrl, required this.foodName, required this.price, required this.userGroup});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),

        color: Colors.green[200],
        
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
          Container(width: 130,
          height: 110,
          color: Colors.white,
          child: Image.network(ImageUrl,fit: BoxFit.cover,),
       
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(foodName,style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   Text(price,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                   userGroup != "Admin"?
                  
                    MaterialButton(
                  onPressed: () async {
                 
                  },
                  color: Colors.green,
                  child: const Text(
                    "ORDER",
                    style: TextStyle(color: Colors.white),
                  ),
                ): 
                    MaterialButton(
                  onPressed: () async {
                 
                  },
                  color: Colors.green,
                  child: const Text(
                    "REMOVE",
                    style: TextStyle(color: Colors.white),
                  ),
                )
                ],)
                ]),
          )
          
          ],),
        ),
      ),
    );
  }
}