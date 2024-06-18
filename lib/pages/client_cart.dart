import 'package:flutter/material.dart';
import 'package:foody/components/widgets/my_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(backgroundColor: Colors.grey,title: Text("MyCart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),), centerTitle: true,),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            height: 500,
              child: ListView(children: [
              
              Card(child: ListTile(title: Text("FoodName"),trailing: Text("Price"),)),
              Card(child: ListTile(title: Text("FoodName"),trailing: Text("Price"),)),
              Card(child: ListTile(title: Text("FoodName"),trailing: Text("Price"),)),
              Card(child: ListTile(title: Text("FoodName"),trailing: Text("Price"),))
              
              ],),
            ),
          Container(child: Column(
        
        
        children: [
              Text("YOUR LOCATION"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [MaterialButton(
                    onPressed: () {
                 
                    },
                    color: Colors.green,
                    child: Text(
                      "VIMBWETA",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 30,),
                  MaterialButton(
                    onPressed: () {
                    // signInUser();
        
                    
                    },
                    color: Colors.green,
                    child: Text(
                      "FUNCTION HALL",
                      style: TextStyle(color: Colors.white),
                    ),
                  )],),

                  SizedBox(height: 20,),
                     Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [MaterialButton(
                    onPressed: () {
                 
                    },
                    color: Colors.green,
                    child: Text(
                      "BOYS HOSTEL",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 30,),
                  MaterialButton(
                    onPressed: () {
                    // signInUser();
        
                    
                    },
                    color: Colors.green,
                    child: Text(
                      "GIRLS HOSTEL",
                      style: TextStyle(color: Colors.white),
                    ),
                  )],), MyButton(onTap: (){}, text: "ORDER NOW"),
                  SizedBox(height: 20,),
        
          Container(
            height: 50,
            color: Colors.red,child: Center(child: Text("PLEASE DISPOSE WASTE IN APROPIATE PLACE ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),)
        ],
            ),
            
          ),
        
          ],
        ),
      ),
    
    );
  }
}