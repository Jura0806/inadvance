import 'package:flutter/material.dart';

class OwnerOrderScreen extends StatefulWidget {
  const OwnerOrderScreen({Key? key}) : super(key: key);

  @override
  _OwnerOrderScreenState createState() => _OwnerOrderScreenState();
}

class _OwnerOrderScreenState extends State<OwnerOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
    );
  }
}
