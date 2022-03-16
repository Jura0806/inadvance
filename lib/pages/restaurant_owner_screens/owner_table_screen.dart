

import 'package:flutter/material.dart';

class OwnerTableScreen extends StatefulWidget {
  const OwnerTableScreen({Key? key}) : super(key: key);

  @override
  _OwnerTableScreenState createState() => _OwnerTableScreenState();
}

class _OwnerTableScreenState extends State<OwnerTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table"),
      ),
    );
  }
}
