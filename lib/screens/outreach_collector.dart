import "package:flutter/material.dart";
import 'package:out_vi/screens/base.dart';

class PageOne extends StatelessWidget {
  PageOne({Key? key, required this.scope}) : super(key: key);

  final scope;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViInputField(
          placeholder: "SHEPHERD'S NAME",
        ),
        ViInputField(placeholder: "SHEPHERD'S CONTACT"),
        ViInputField(
          placeholder: "DATE OF OUTREACH",
        ),
        ViInputField(placeholder: "BACENTER"),
        ViInputField(placeholder: "CENTER"),
      ],
    );
  }
}

class PageTwo extends StatelessWidget {
  PageTwo({Key? key, required this.scope}) : super(key: key);

  final scope;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ViInputField(placeholder: "NAME OF SOUL"),
      ViInputField(placeholder: "CONTACT OF SOUL (MOBILE)"),
      ViInputField(placeholder: "CONTACT OF SOUL (WHATSAPP)"),
      ViInputField(placeholder: "IS SOUL SAVED?"),
      ViInputField(placeholder: "PREVIOUS CHURCH"),
    ]);
  }
}

class PageThree extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViInputField(placeholder: "SOUL'S LOCATION (DESCRIPTION)"),
      ],
    );
  }
}

class OutreachScreen extends StatefulWidget {
  OutreachScreen({Key? key}) : super(key: key);

  @override
  _OutreachScreenState createState() => _OutreachScreenState();
}

class _OutreachScreenState extends State<OutreachScreen> {
  int _pageIndex = 0;

  final _pageOneFocusNode = FocusNode();
  final _pageTwoFocusNode = FocusNode();

  void _moveBack() {
    setState(() {
      _pageIndex = _pageIndex > 0 ? _pageIndex - 1 : _pageIndex;
    });
  }

  void _moveNext() {
    setState(() {
      _pageIndex = _pageIndex < 2 ? _pageIndex + 1 : _pageIndex;
    });
  }

  void _switchPage(int index) {
    setState(() {
      _pageIndex = index;
    });
    // index == 0 ? FocusScope.of(context).requestFocus(_pageOneFocusNode) : FocusScope.of(context).requestFocus(_pageTwoFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView(
        child: Center(
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 48, right: 48, bottom: 70),
              child: Column(
                children: [
                  PageTitle(
                    title: "FILL IN THE DATA BELOW",
                    size: 12,
                    light: true,
                  ),
                  IndexedStack(
                    index: _pageIndex,
                    children: [
                      PageOne(scope: _pageOneFocusNode),
                      PageTwo(scope: _pageTwoFocusNode),
                      PageThree(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutViButton(
                          title: "PREVIOUS",
                          icon: Icons.arrow_left,
                          iconPosition: "left",
                          onPressed: () => {_moveBack()}),
                      OutViButton(
                          title: "NEXT",
                          icon: Icons.arrow_right,
                          onPressed: () => {_moveNext()}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
