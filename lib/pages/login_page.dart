import 'package:flutter/material.dart';
import 'package:foody/pages/admin_page.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.green[100],

body: SafeArea(
  child: 
      Center(
        child: Column(children: [

 const SizedBox(
                  height: 200,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43), fontSize: 22),
                ),
                SizedBox(height: 30,),
             

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(),
                        hintText: "Add a new task",
                      ),
                    ),
      ),
                  SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(),
                        hintText: "Add a new task",
                                            ),
                                          ),
                      ),
                      SizedBox(height: 20,),


                      MaterialButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage()));
      },
      color: Colors.green,
      child: Text("Login",style: TextStyle(color: Colors.white),),
    )
        ],),
      ),
   
),



    );
  }
}