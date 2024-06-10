import 'package:flutter/material.dart';
import 'package:foody/pages/auth_page.dart';
import 'package:foody/pages/client_page.dart';
import 'package:foody/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text(
          "CafeApp",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: 
      
        SafeArea(
          child: Container(
            height: double.infinity,
            child: Column(
              children: [
        
        
        Text("CAFERERIA",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Container(
            width: double.infinity,
            height: 400,
            child: Image(
              image: AssetImage("assets/zege.jpeg"),
              //fit: BoxFit.cover,
            ),
          ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.green)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientPage()));
                    },
                    child: Container(
                      height: 50,
                      width: 70,
                      child: Center(child: Text("Client",style: TextStyle(color: Colors.white,fontSize: 20))))),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.green)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AuthPage()));
                    },
                    child: Container(
                      height: 50,
                      width: 70,
                      child: Center(child: Text("Admin",style: TextStyle(color: Colors.white,fontSize: 20),)))),
              ],
            ),
          ),
        ),
     
    );
  }
}
