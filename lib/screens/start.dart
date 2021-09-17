import 'package:flutter/material.dart';
import 'package:out_vi/screens/base.dart';
import 'package:out_vi/screens/reason.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red,
      g = color.green,
      b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? r : (255 - g)) * ds).round(),
        b + ((ds < 0 ? r : (255 - b)) * ds).round(),
        1);
  });
  return MaterialColor(color.value, swatch);
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        child: Center(
          child: Column(
            children: [
              PageTitle(title: "Anagkazo Assemblies Abeka\nData Collection"),
              Padding(
                padding: EdgeInsets.only(bottom: 78),
                child: Text("OUTREACH AND VISITATION DATA COLLECTION APP"),
              ),
              Image.asset("assets/images/data.jpg"),
              Spacer(),
              Text("CLICK ON BUTTON TO GET STARTED"),
              Spacer(),
              OutViButton(
                title: "START", icon: Icons.arrow_right, onPressed: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => ReasonScreen()));
              },),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
