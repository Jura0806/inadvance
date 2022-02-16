import 'package:flutter/material.dart';

class OwnerSettingScreen extends StatefulWidget {
  const OwnerSettingScreen({Key? key}) : super(key: key);

  @override
  _OwnerSettingScreenState createState() => _OwnerSettingScreenState();
}

class _OwnerSettingScreenState extends State<OwnerSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
    );
  }
}
