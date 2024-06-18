import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foody/firebase_options.dart';
import 'package:foody/pages/home_page.dart';
import 'package:foody/pages/login_page.dart';
import 'package:foody/pages/login_page1.dart';

void main()async {
     WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Flutter Demo',
   //flutter run -d chrome --web-renderer html
      home: width <= 500 ? ClientLoginPage() : HomePage(),
    );
  }
}
