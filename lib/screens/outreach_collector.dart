import 'dart:convert';

import "package:flutter/material.dart";
import 'package:out_vi/screens/base.dart';
import "package:http/http.dart" as http;

class PageOne extends StatelessWidget {
  PageOne({required this.formKey});

  final GlobalKey<FormState> formKey;

  // Field controllers
  final _shepherds_name_ctrl = TextEditingController();
  final _shepherds_contact_mobile_ctrl = TextEditingController();
  final _shepherds_contact_whatsapp_ctrl = TextEditingController();
  final _date_of_outreach_ctrl = TextEditingController();
  final _region_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ViInputField(
              placeholder: "SHEPHERD'S NAME",
              controller: _shepherds_name_ctrl,
            ),
            ViInputField(
              placeholder: "SHEPHERD'S CONTACT MOBILE",
              controller: _shepherds_contact_mobile_ctrl,
            ),
            ViInputField(
              placeholder: "SHEPHERD'S CONTACT WHATSAPP",
              controller: _shepherds_contact_whatsapp_ctrl,
            ),
            ViInputField(
              placeholder: "DATE OF OUTREACH",
              controller: _date_of_outreach_ctrl,
            ),
            ViInputField(
              placeholder: "REGION",
              controller: _region_ctrl
            )
          ],
        ),
      ),
    );
  }

  Map<String, String> getFormData() {
    // final List<TextEditingController> controllers = [_shepherds_name_ctrl, _shepherds_contact_ctrl, _date_of_outreach_ctrl, _bacenter_ctrl, _center_ctrl, _center_ctrl];

    final Map<String, String> data = {
      "shepherd_name": _shepherds_name_ctrl.text,
      "shepherd_contact_mobile": _shepherds_contact_mobile_ctrl.text,
      "shepherd_contact_whatsapp": _shepherds_contact_whatsapp_ctrl.text,
      "date": _date_of_outreach_ctrl.text,
      "region": _region_ctrl.text,
    };

    return data;
  }
}

class PageTwo extends StatelessWidget {
  PageTwo({required this.formKey});

  final GlobalKey<FormState> formKey;

  final _name_of_soul_ctrl = TextEditingController();
  final _contact_of_soul_ctrl = TextEditingController();
  final _contact_of_soul_whatsapp_ctrl = TextEditingController();
  final _soul_saved_ctrl = TextEditingController();
  final _previous_church_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ViInputField(
              placeholder: "NAME OF SOUL",
              controller: _name_of_soul_ctrl,
            ),
            ViInputField(
              placeholder: "CONTACT OF SOUL (MOBILE)",
              controller: _contact_of_soul_ctrl,
            ),
            ViInputField(
              placeholder: "CONTACT OF SOUL (WHATSAPP)",
              controller: _contact_of_soul_whatsapp_ctrl,
            ),
            ViInputField(
              placeholder: "IS SOUL SAVED?",
              controller: _soul_saved_ctrl,
            ),
            ViInputField(
              placeholder: "PREVIOUS CHURCH",
              controller: _previous_church_ctrl,
            ),
          ],
        ),
      ),
    );
  }

  Map <String, String> getFormData() {
    final Map <String, String> data = {
      "soul_name": _name_of_soul_ctrl.text,
      "soul_contact_mobile": _contact_of_soul_ctrl.text,
      "soul_contact_whatsapp": _contact_of_soul_whatsapp_ctrl.text,
      "soul_saved": _soul_saved_ctrl.text,
      "soul_previous_church": _previous_church_ctrl.text
    };

    return data;
  }
}

class PageThree extends StatelessWidget {
  PageThree({required this.formKey});

  final GlobalKey<FormState> formKey;

  final _soul_location_ctrl = TextEditingController();
  final _bacenta_ctrl = TextEditingController();
  final _center_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ViInputField(
              placeholder: "SOUL'S LOCATION (DESCRIPTION)",
              controller: _soul_location_ctrl,
            ),
            ViInputField(
              placeholder: "BACENTA",
              controller: _bacenta_ctrl,
            ),
            ViInputField(
              placeholder: "CENTER",
              controller: _center_ctrl,
            ),
          ],
        ),
      ),
    );
  }

  Map <String, String> getFormData() {
    final Map<String, String> data = {
      "soul_location_description": _soul_location_ctrl.text,
      "bacenta": _bacenta_ctrl.text,
      "center": _center_ctrl.text,
    };

    return data;
  }
}

class DonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 78, horizontal: 20),
            child: Column(
              children: [
                PageTitle(title: "Data Submitted Successfully"),
                Padding(
                  padding: EdgeInsets.only(bottom: 78),
                  child: Text(
                    "THANK YOU FOR SUBMITTING YOUR INFORMATION",
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset("assets/images/done.png"),
                Spacer(),
                Text(
                  "CLICK ON BUTTON BELOW IF YOU WANT SUBMIT ANOTHER DATA",
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                OutViButton(
                    title: "START", icon: Icons.arrow_right, onPressed: () {})
              ],
            ),
          ),
        ),
      ),
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

  final GlobalKey<FormState> _pageOneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _pageTwoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _pageThreeFormKey = GlobalKey<FormState>();

  late final pageOne = PageOne(formKey: _pageOneFormKey);
  late final pageTwo = PageTwo(formKey: _pageTwoFormKey);
  late final pageThree = PageThree(formKey: _pageThreeFormKey);

  void _moveBack() {
    setState(() {
      _pageIndex = _pageIndex > 0 ? _pageIndex - 1 : _pageIndex;
    });
  }

  void _moveNext() {
    setState(() {
      switch (_pageIndex) {
        case 0:
          if (_pageOneFormKey.currentState!.validate()) {
            _pageIndex = _pageIndex < 2 ? _pageIndex + 1 : _pageIndex;
          }
          break;
        case 1:
          if (_pageTwoFormKey.currentState!.validate()) {
            _pageIndex = _pageIndex < 2 ? _pageIndex + 1 : _pageIndex;
          }
          break;
        case 2:
          if (_pageThreeFormKey.currentState!.validate()) {
            print("Saved");
            var res = testServer();
            res.then((value) => {print(value.status)});
            submitOutreachData();
          }
          break;
        default:
          if (_pageOneFormKey.currentState!.validate()) {
            _pageIndex = _pageIndex < 2 ? _pageIndex + 1 : _pageIndex;
          }
          break;
      }
    });
  }

  void _switchPage(int index) {
    setState(() {
      _pageIndex = index;
    });
    // index == 0 ? FocusScope.of(context).requestFocus(_pageOneFocusNode) : FocusScope.of(context).requestFocus(_pageTwoFocusNode);
  }

  void _submitOutreach(context) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => DonePage()));
  }

  void submitOutreachData () {
    final Map<String, String> data = {
      ...pageOne.getFormData(),
      ...pageTwo.getFormData(),
      ...pageThree.getFormData(),
    };

    print(data);

    final Future<http.Response> response = sendData(data, "outreach");
    response.then((value) {
      var body = jsonDecode(value.body);
      print(body);
      if (body["status"]) {
        Navigator.push(context, new MaterialPageRoute(
          builder: (context) => DonePage()
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 48, right: 48, bottom: 70),
            child: Column(
              children: [
                PageTitle(
                    title: "FILL IN THE DATA BELOW", size: 12, light: true),
                IndexedStack(
                  index: _pageIndex,
                  children: [
                    pageOne,
                    pageTwo,
                    pageThree
                  ],
                ),
                Wrap(spacing: 20, children: [
                  OutViButton(
                    title: "PREVIOUS",
                    icon: Icons.arrow_left,
                    onPressed: () => {_moveBack()},
                  ),
                  OutViButton(
                      title: _pageIndex < 2 ? "NEXT" : "SUBMIT",
                      icon: Icons.arrow_right,
                      onPressed: () => {_moveNext()}),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
