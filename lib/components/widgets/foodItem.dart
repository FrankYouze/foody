import 'package:flutter/material.dart';
import 'package:foody/pages/admin_page.dart';

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

        color: Colors.green[200],
        
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
          Container(width: 130,
          height: 110,
          color: Colors.white,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("SOMETHING BIG GOES HERE",style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   Text("PRICE /=",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  
                    MaterialButton(
                  onPressed: () async {
                 
                  },
                  color: Colors.green,
                  child: const Text(
                    "ORDER",
                    style: TextStyle(color: Colors.white),
                  ),
                )],)
                ]),
          )
          
          ],),
        ),
      ),
    );
  }
}