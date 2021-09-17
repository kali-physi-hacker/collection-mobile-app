import "package:flutter/material.dart";
import 'package:out_vi/screens/reason.dart';
import 'package:out_vi/screens/start.dart';


void main() {
  runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      title: "OutVi",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: createMaterialColor(Color(0xFF000000)), fontFamily: 'MuseoModerno'),
      home: StartScreen(),
    );
  }
}