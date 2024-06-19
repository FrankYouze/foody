import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody/pages/auth_page.dart';

class PassConpage extends StatefulWidget {
  const PassConpage({super.key});

  @override
  State<PassConpage> createState() => _PassConpageState();
}

class _PassConpageState extends State<PassConpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Text(
                  "RESET PASSWORD",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43), fontSize: 22),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller:TextEditingController(),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(),
                      hintText: "Enter old password",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(),
                      hintText: "Enter new password",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                  // signInUser();
                     //FirebaseAuth.instance.signOut();
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
                     Navigator.push(context,MaterialPageRoute(builder: (context)=> AuthPage()))
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
      ),
    );;
  }
}