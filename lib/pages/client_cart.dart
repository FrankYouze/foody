import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foody/components/widgets/my_button.dart';
import 'package:foody/components/widgets/orderItem.dart';
import 'package:foody/components/widgets/order_placed.dart';
import 'package:foody/models/cartItem.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final DatabaseReference OrderList =
      FirebaseDatabase.instance.ref().child("OrderList");
  final FirebaseAuth auth = FirebaseAuth.instance;
 String Location = '';

 void placeOrder()async{

      final User? user = auth.currentUser;
                        final uid = user?.uid;
    await OrderList.child(uid!).set({
                                    "Location" : Location,
                                    "Orders": context.read<Cart>().cart.toString()
                          });
                          showDialog(context: context, builder: (context){

                            return OrderPlaced();
                          });
 }

  @override
  Widget build(BuildContext context) {
    final cartFoods = context.watch<Cart>().cart;
   
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey[900],
        title: Text(
          "MyCart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              child: cartFoods.length == 0
                  ? Center(child: Text("NO FOODS IN CART"))
                  : ListView.builder(
                      itemCount: cartFoods.length,
                      itemBuilder: (context, i) {
                        return OrderItem(
                            foodName: cartFoods[i].FoodName,
                            price: cartFoods[i].FoodPrice,
                            ClientRemov: () {
                              context.read<Cart>().removeFromCart(cartFoods[i]);
                            },
                            userGroup: "user");
                      },
                    ),
            ),
            Container(
              child: Column(
                children: [
                  Text("YOUR LOCATION",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            Location = "VIMBWETA";
                          });
                        },
                        color: Colors.grey,
                        child: Text(
                          "VIMBWETA",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                            setState(() {
                            Location = "FUNCTION HALL";
                          });
                        },
                        color: Colors.grey,
                        child: Text(
                          "FUNCTION HALL",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                            setState(() {
                            Location = "BOYS HOSTEL";
                          });
                        },
                        color: Colors.grey,
                        child: Text(
                          "BOYS HOSTEL",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            Location = "GIRLS HOSTEL";
                          });
                        },
                        color: Colors.grey,
                        child: Text(
                          "GIRLS HOSTEL",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  MyButton(
                      onTap: () async {
                      //  print(Location);
                        // final User? user = auth.currentUser;
                        // final uid = user?.uid;
                        // print(context.read<Cart>().cart.toString());
                       Location != ''?
                        // await OrderList.child(uid!).set({
                        //             "Location" : Location,
                        //             "Orders": context.read<Cart>().cart.toString()
                        //   })
                        //   showDialog(context: context, builder: (context){

                        //     return OrderPlaced();
                        //   });
                        placeOrder()
                           :  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Please select a location')),
  );
                      },
                      text: "ORDER NOW"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      "PLEASE DISPOSE WASTE IN APROPIATE PLACE ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
