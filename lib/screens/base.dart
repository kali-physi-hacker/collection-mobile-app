import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

final String BASE_API_URL = "https://kaliubuntupythonanywhere.pythonanywhere.com/api";

class PageTitle extends StatelessWidget {
  const PageTitle(
      {Key? key, required this.title, this.size = 24.0, this.light = false})
      : super(key: key);

  final String title;
  final double size;
  final bool light;

  @override
  Widget build(BuildContext build) {
    return Padding(
      padding: EdgeInsets.only(top: 50.0, bottom: 31.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: size,
            fontWeight: light ? FontWeight.normal : FontWeight.bold),
      ),
    );
  }
}

class OutViButton extends StatelessWidget {
  const OutViButton(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed,
      this.iconPosition = "right"})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final IconData icon;
  final String iconPosition;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        width: 102,
        height: 36,
        child: Center(
          child: Wrap(
            direction: Axis.vertical,
            children: [
              iconPosition == "left" ? Icon(icon) : Text(""),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              iconPosition == "right" ? Icon(icon) : Text(""),
            ],
          ),
        ),
      ),
    );
  }
}

class ViInputField extends StatelessWidget {
  const ViInputField({Key? key, required this.placeholder, this.name = "", this.controller})
      : super(key: key);

  final String placeholder;
  final String name;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "This field is required!";
          }
        },
        onSaved: (value) {
          print("something");
        },
        style: TextStyle(fontSize: 16),
        decoration: new InputDecoration(
          labelText: placeholder,
          labelStyle: TextStyle(fontSize: 12),
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          )
        ),
        // validator: validator,
      ),
    );
  }
}

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: child,
        ),
      ),
    );
  }
}

class ServerTest {
  ServerTest({required this.status});

  final String status;

  factory ServerTest.fromJson(Map<String, dynamic> json) {
    return ServerTest(status: json["status"]);
  }
}

Future<ServerTest> testServer() async {
  final response = await http.get(
    Uri.parse('https://kaliubuntupythonanywhere.pythonanywhere.com/api/test/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
  );

  if (response.statusCode == 200) {
    return ServerTest.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to get data");
  }
}

Future<http.Response> sendData (Map<String, String> data, String category) {
  final String jsonData = jsonEncode(data);
  return http.post(
    Uri.parse(BASE_API_URL+"/"+category+"/new/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonData
  );
}