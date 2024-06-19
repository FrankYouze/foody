import 'package:flutter/material.dart';
import 'package:foody/components/client_drinks.dart';
import 'package:foody/components/client_food.dart';
import 'package:foody/components/widgets/dialogbox.dart';
import 'package:foody/pages/Pass_conPage.dart';

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
      appBar: AppBar(title: Text("ADMIN APP"),backgroundColor: Colors.grey,actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(icon: Icon(Icons.admin_panel_settings,size: 30,),onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> PassConpage()));
          }),
        )
      ],),
       floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          backgroundColor: Colors.grey,
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
              child: ListView(
                children: [
                  Card(
                    child: ListTile(title: Text("FOOD NAME"),
                    trailing: Column(children: [Text("LOCATION"),
                    Text("PHONE NUMBER"),
                    
                    
                    ],),
                    ),
                  ),
                  Card(
                    child: ListTile(title: Text("FOOD NAME"),
                    trailing: Column(children: [Text("LOCATION"),
                    Text("PHONE NUMBER"),
                    
                    
                    ],),
                    ),
                  ),
                  Card(
                    child: ListTile(title: Text("FOOD NAME"),
                    trailing: Column(children: [Text("LOCATION"),
                    Text("PHONE NUMBER"),
                    
                    
                    ],),
                    ),
                  )
                ],
              )),
          ))
          
          ],
        ),
      ),
    );
  }
}