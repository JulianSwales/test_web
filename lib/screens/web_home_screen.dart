import 'dart:async';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebHomeScreen extends StatefulWidget {
  @override
  _WebHomeScreenState createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter user management'),
      ),
      body: Center(
        child: SizedBox(
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Sign in'),
          ),
        ),
      ),
    );
  }
}
