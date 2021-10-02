import 'package:flutter/material.dart';
import 'package:out_vi/screens/base.dart';


class VisitationScreen extends StatefulWidget {
  VisitationScreen({Key? key}) : super(key: key);

  @override
  _VisitationScreenState createState() => _VisitationScreenState();
}


class _VisitationScreenState extends State<VisitationScreen> {

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: SingleChildScrollView(
          child: Center(
            child: Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 48, right: 48, bottom: 70)
              ),
            ),
          ),
        ),
    );
  }
}