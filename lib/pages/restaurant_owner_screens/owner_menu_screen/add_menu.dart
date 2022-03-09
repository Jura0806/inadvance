import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/utils/formfield.dart';
import 'package:inadvance/utils/responsive_size.dart';
class AddMenu extends StatefulWidget {
  const AddMenu({Key? key}) : super(key: key);

  @override
  _AddMenuState createState() => _AddMenuState();
}
double _height = 190;
bool icon = true;
class _AddMenuState extends State<AddMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text("Add new"),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: getProportionateScreenHeight(175.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius:
                BorderRadius.all(Radius.circular(8))),
              ),
            Container(
              padding:EdgeInsets.all(getProportionateScreenWidth(16)),
              child: Column(
                children: [
                  CustomFormField(
                    hint: 'Name food',
                  ),
                  CustomFormField(
                    inputType: TextInputType.number,
                    hint: 'Cost',
                  ),
                  CustomFormField(
                   // hint: 'Description',
                    line: 4,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.green,
                      primary: Colors.green
                    ),
                      onPressed: (){
                        setState(() {
                          _height = _height == 0 ? 100 : 0;
                          icon =! icon;
                        });
                      },
                      child: ListTile(
                        leading: Text('Salat',
                        style: TextStyle(
                          fontSize: 18
                        ),),
                        trailing: icon?Icon(Icons.arrow_upward_outlined):Icon(Icons.arrow_downward_outlined),
                      ),
                  ),
                  AnimatedContainer(
                    decoration: BoxDecoration(
                      color: Colors.green,
                        borderRadius: BorderRadius.only(
                           bottomLeft: Radius.circular(4),
                           bottomRight: Radius.circular(4),
                        )
                    ),
                    height: _height,
                      width: double.infinity,
                      duration: Duration(milliseconds: 100),
                  child: Container(
                    height: 90,
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context,index)=>
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("\n\t\t\t\tFast Food"),
                        ],
                      ),
                    ),
                  ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
