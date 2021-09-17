import "package:flutter/material.dart";

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
  const ViInputField({Key? key, required this.placeholder}) : super(key: key);

  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: TextField(
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
                borderSide: BorderSide(color: Colors.amber))),
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
