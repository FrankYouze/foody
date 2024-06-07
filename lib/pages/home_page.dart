import 'package:flutter/material.dart';
import 'package:foody/pages/client_page.dart';
import 'package:foody/pages/login_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.green[100],
appBar: AppBar(title: Text("CafeApp",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,),


body: Center(child: Container(height: 300,child: Column(children: [

ElevatedButton(
  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.green)),
  onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));

  }, child: Text("Admin")),
  SizedBox(height: 20,),
  
ElevatedButton(
  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.green)),
  onPressed: (){

    Navigator.push(context, MaterialPageRoute(builder: (context)=> ClientPage()));
  }, child: Text("Client")),

],),),),


    );
  }
}