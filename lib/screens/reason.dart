import "package:flutter/material.dart";
import 'package:out_vi/screens/base.dart';
import 'package:out_vi/screens/outreach_collector.dart';

class ReasonScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageTitle(title: "Reason For Data Collection?"),
          Spacer(),
          Expanded(
            flex: 1,
            child: Wrap(spacing: 50, direction: Axis.vertical, children: [
              OutViButton(
                  title: "OUTREACH",
                  icon: Icons.arrow_right,
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => OutreachScreen(),
                        ));
                  }),
              OutViButton(
                title: "VISITATION",
                icon: Icons.arrow_right,
                onPressed: () {},
              ),
            ]),
          ),
          Spacer()
        ],
      )),
    );
  }
}
