import 'package:flutter/material.dart';
import 'package:foody/models/AdminAuth.dart';
import 'package:provider/provider.dart';

class AdminSession extends StatefulWidget {
   AdminSession({super.key});

 
  @override
  State<AdminSession> createState() => _AdminSessionState();
}

class _AdminSessionState extends State<AdminSession> {

 final oldPassCon = TextEditingController();
  final newPassCon = TextEditingController();

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
                  "MANAGE PASSWORD",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43), fontSize: 22),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller:oldPassCon,
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
                    controller: newPassCon,
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
          
   final currentPassword = oldPassCon.text;
                final newPassword = newPassCon.text;
                final auth = context.read<AdminAuth>();

                if (auth.isAuthenticated && auth.pass == currentPassword) {
                  auth.changePassword(newPassword);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password changed successfully!')),
                  );




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
    context.read<AdminAuth>().logout();
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
    );
  }
}