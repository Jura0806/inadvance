import 'package:flutter/material.dart';

class UserShopScreen extends StatefulWidget {
  const UserShopScreen({Key? key}) : super(key: key);
  static final String id = "user_shop_screen";

  @override
  _UserShopScreenState createState() => _UserShopScreenState();
}

class _UserShopScreenState extends State<UserShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
      ),
    );
  }
}
