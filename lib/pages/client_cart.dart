import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foody/components/widgets/my_button.dart';
import 'package:foody/components/widgets/orderItem.dart';
import 'package:foody/components/widgets/order_placed.dart';
import 'package:foody/models/cartItem.dart';
import 'package:provider/provider.dart';
import 'package:azampay/azampay.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final DatabaseReference OrderList =
      FirebaseDatabase.instance.ref().child("OrderList");
  final DatabaseReference UserList =
      FirebaseDatabase.instance.ref().child("RegUsers");
  final FirebaseAuth auth = FirebaseAuth.instance;
  String Location = '';
  Map<dynamic, dynamic> UserMap = {};
  String name = '';
  String phone = '';
  int ThisPrice = 0;
  int TotalPrice = 0;

  // get these credentials from the azampay developers account
      var azampay = AzamPay(
    sandbox: true, // set to false on production
    appName: "CafeApp",
    clientId: "91788df1-c1b3-444a-96ab-e1e513049ae9",
    clientSecret:"CSEGSs+DDf5/+EliOOu4W127XuckZJSpSbZef8rScbTJ5GI85nJs5Jv/w6yGmhs/dfwvGrjTB4JnUL+l6a2+E9z1UaYkkkV4kcd7mUp/GWd4Dx/hqfpb37xhIiO3ij/aIbPAGF0ajIyjN8IEmABt10nVxBvhcjRTGkwhKgAm1ArWOJw1z2hEhhAENAgImWUWxT4zOC+zKJakIrL8dXPYypdgy/8znvqIqEk9EnNaYm/TBiG2QhvC6oCrXwnf4NKnGOq8QkMQ9C1zFe7iWJ2ABLMXMV80rAcnQ2qjHo5Kq53NSiNbOXHZ+ODC4gjICZ2PjtlT7qrRJ6DmGSEI8UcOMWlAaRTWiuk+FrGuvEXnpD0/1RAFLiSWhej7jZweYurfibamyUUzMTQm+YFDwiY7X/Ggryq+GwlJzoM4VR/BFePRH6WsRWKPlOzqWa9J8ZscMJmII2m99ohJfWrjYOkfFjs1xw4M7kCq2Ymn57bhbBWN9L5tSeamBZjDLSgxWOOqqBwUyPbwwOW2jReG7OwF1g9symqroRyuE9i3dnx1mvvRyJUipFzpX0R15xFvKnPPwmQcCG/JRlIU3InKgoh23LwhWRwDBCmMepndr3HC55vNEdX81Fr6Bf9tfuATLbFIINlNhxlPHIWcFMguSCW4EFibSs+F2KdAAZOl6J19nL8="
);


  void placeOrder(int price) async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    await OrderList.child(uid!).set(
        {"Location": Location, 
        "Name": name,
        "PhoneNumber": phone,
        "TotalPrice": price,
        "Orders": context.read<Cart>().cart.toString()});

//START HERE

var mobileResponse = await azampay.mobileCheckout(
    merchantMobileNumber: "0744619568",
    amount: "$price",
    currency: "TZS", // ["TZS"]
    provider: "Mpesa", // ["Airtel" "Tigo" "Halopesa" "Azampesa"]
    externalId: "123123",
    additionalProperties: {}
    );
    
print(json.decode(mobileResponse.body));
final Map<String, dynamic> decodedResponse = json.decode(mobileResponse.body);
 final confirmMessage = decodedResponse.keys.elementAt(2);
 print (decodedResponse[confirmMessage]);

//END HERE



    showDialog(
        context: context,
        builder: (context) {
          return OrderPlaced(confirm: decodedResponse[confirmMessage]);
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final User? user = auth.currentUser;
    final uid = user?.uid;
    UserList.child(uid!).onValue.listen((event) {
      setState(() {
        UserMap = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);

     //   print("${UserMap['PhoneNumber']} idiii");

        name = UserMap['Name'];
        phone = UserMap['PhoneNumber'];
      });
    });
  }



  @override
  Widget build(BuildContext context) {

    
 int total = 0;     
    final cartFoods = context.watch<Cart>().cart;
 for (var item in cartFoods) {
    total += int.parse(item.FoodPrice);
  }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey[900],
        title: const Text(
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
                  ? const Center(child: Text("NO FOODS IN CART"))
                  : ListView.builder(
                   
                      itemCount: cartFoods.length,
                      itemBuilder: (context, i) {
                        ThisPrice = int.parse(cartFoods[i].FoodPrice);
                        print("${ThisPrice} price");
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
              
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Total Price: $total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    "YOUR LOCATION",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
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
                        child: const Text(
                          "VIMBWETA",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            Location = "FUNCTION HALL";
                          });
                        },
                        color: Colors.grey,
                        child: const Text(
                          "FUNCTION HALL",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
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
                        child: const Text(
                          "BOYS HOSTEL",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            Location = "GIRLS HOSTEL";
                          });
                        },
                        color: Colors.grey,
                        child: const Text(
                          "GIRLS HOSTEL",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  MyButton(

                    
                      onTap: () async {
                        if (Location.isNotEmpty) {
          
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select a location'),
            ),
          );
        }
                        //  print(Location);
                        // final User? user = auth.currentUser;
                        // final uid = user?.uid;
                        // print(context.read<Cart>().cart.toString());
                        Location != ''
                            ?
                            // await OrderList.child(uid!).set({
                            //             "Location" : Location,
                            //             "Orders": context.read<Cart>().cart.toString()
                            //   })
                            //   showDialog(context: context, builder: (context){

                            //     return OrderPlaced();
                            //   });
                            placeOrder(total)
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please select a location')),
                              );



                              //START HERE


    









                              //END HERE
                      },
                      text: 'Pay Now'
                      ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    color: Colors.red,
                    child: const Center(
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
 