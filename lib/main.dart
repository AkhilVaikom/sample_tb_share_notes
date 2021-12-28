import 'package:flutter/material.dart';
import 'package:tb_share_notes/screens/splash_screen/splash_screen.dart';

void  main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}