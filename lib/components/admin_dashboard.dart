import 'package:flutter/material.dart';
import 'package:foody/components/client_drinks.dart';
import 'package:foody/components/client_food.dart';
import 'package:foody/components/order_list.dart';
import 'package:foody/components/widgets/dialogbox.dart';
import 'package:foody/pages/Pass_conPage.dart';
import 'package:foody/pages/newSession.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
 void addNewFood() {
    
    showDialog(
      context: context,
      builder: (context) {
        return MyDialogBox(
        
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CafeApp/Manager",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),backgroundColor: Colors.grey[800],actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(icon: Icon(Icons.person,size: 30,),onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminSession()));
          }),
        )
      ],
      iconTheme: IconThemeData(color: Colors.white),
      ),
       floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          backgroundColor: Colors.grey[900],
          onPressed: addNewFood,child: Icon(Icons.add,color: Colors.white,size: 30,),),
      ),
      body: SafeArea(
      
        child: Row(
          children: [Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
              color: Colors.grey,
              child:ClientFood(user: "Admin") ),
          )),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
                color: Colors.grey,
              child: ClientDrinks(user: "Admin")),
          )),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
                color: Colors.grey,
              child: OrderList()),
          ))
          
          ],
        ),
      ),
    );
  }
}