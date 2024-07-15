import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foody/models/cartItem.dart';
import 'package:foody/pages/auth_page.dart';
import 'package:provider/provider.dart';

class PassConpage extends StatefulWidget {
  PassConpage({super.key});

  @override
  State<PassConpage> createState() => _PassConpageState();
}

class _PassConpageState extends State<PassConpage> {
  final _firebaseAuth = FirebaseAuth.instance;
  final _emailCon = TextEditingController();
  Map<dynamic, dynamic> details = {};
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference mydetails =
      FirebaseDatabase.instance.ref().child("RegUsers");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final User? user = auth.currentUser;
    final uid = user?.uid;
    mydetails.child(uid!).onValue.listen((event) {
      setState(() {
        // print("hellw world");
        details = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
        print("${details["Name"]} details");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String name = details["Name"];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              const Text(
                "MANAGE YOUR PROFILE",
                style: TextStyle(
                    color: Color.fromARGB(255, 44, 43, 43), fontSize: 22),
              ),
              SizedBox(
                height: 30,
              ),
           Container(
            height:100,
            width: 100,
            child: Icon(Icons.person,color: Colors.white,size: 60,),
            decoration: 
           BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[700]
          
          
           )
           ,),             
              SizedBox(
                height: 30,
              ),
              Text(
                details["Name"],
                style: TextStyle(
                    color: Color.fromARGB(255, 44, 43, 43), fontSize: 22),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                details["PhoneNumber"],
                style: TextStyle(
                    color: Color.fromARGB(255, 44, 43, 43), fontSize: 22),
              ),
              SizedBox(
                height: 30,
              ),
              const Text(
                "RESET PASSWORD",
                style: TextStyle(
                    color: Color.fromARGB(255, 44, 43, 43), fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailCon,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(),
                    hintText: "enter your email",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () async {
                  // signInUser();
                  //FirebaseAuth.instance.signOut();
          
                  try {
                    await _firebaseAuth.sendPasswordResetEmail(
                        email: _emailCon.text);
          
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                                "Reset Password Link has been sent to your email"),
                          );
                        });
                  } on FirebaseAuthException catch (err) {
                    //throw Exception(err.message.toString());
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(err.message.toString()),
                          );
                        });
                  } catch (err) {
                    throw Exception(err.toString());
                  }
                },
                color: Colors.grey,
                child: Text(
                  "RESET",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  // signInUser();
                  FirebaseAuth.instance.signOut();
          
                  context.read<Cart>().clearCart();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthPage()));
                },
                color: Colors.grey,
                child: Text(
                  "LOG OUT",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
