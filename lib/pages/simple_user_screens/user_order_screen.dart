import 'package:flutter/material.dart';

class UserOrderScreen extends StatefulWidget {
  const UserOrderScreen({Key? key}) : super(key: key);
  static final String id = "user_order_screen";

  @override
  _UserOrderScreenState createState() => _UserOrderScreenState();
}

class _UserOrderScreenState extends State<UserOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: SingleChildScrollView(
        reverse: true,

        scrollDirection: Axis.vertical,
        child: Column(
          children: [
           Container(height: 200,color: Colors.green,),
            SizedBox(height: 20,),
            Container(height: 200,color: Colors.green,),
            SizedBox(height: 20,),
            Container(height: 200,color: Colors.green,),
            SizedBox(height: 20,),
            Container(height: 200,color: Colors.green,),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
