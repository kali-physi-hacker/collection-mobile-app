import "package:flutter/material.dart";
import 'package:out_vi/screens/base.dart';
import 'package:out_vi/screens/outreach_collector.dart';

class ReasonScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Column(
          children: [
            PageTitle(title: "Reason for Data Collection"),
            Spacer(),
            OutViButton(title: "OUTREACH", icon: Icons.arrow_right, onPressed: (){
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => OutreachScreen(),
                )
              );
            }),
            SizedBox(height: 50,),
            OutViButton(title: "VISITATION", icon: Icons.arrow_right, onPressed: (){}),
            Spacer(),
          ]
        ),
      ),
    );
  }
}
