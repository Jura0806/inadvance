import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inadvance/utils/responsive_size.dart';

class CustomFormField extends StatefulWidget {
  TextEditingController? controller;
  String hint;
  int line;
  TextInputType? inputType;
  bool obscureText;
  Widget? suffix;
  Widget? prefix;
  CustomFormField(
      {Key? key,
        this.controller,
        this.line = 1,
        this.inputType = TextInputType.text,
        this.hint = '',
        this.obscureText = false,
        this.prefix,
        this.suffix})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init;
    return Padding(
<<<<<<< HEAD
      padding: EdgeInsets.only(bottom: getWidth(15.0)),
=======
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(15.0)),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
      child: TextFormField(
        maxLines:widget.line,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: _checkFieldEmpty,
       /* inputFormatters: [
          LengthLimitingTextInputFormatter(120)
        ],*/ //! it's for hint maxlenth name

        decoration: InputDecoration(
          suffixIcon: widget.suffix,
          prefixIcon: widget.prefix,

          border: OutlineInputBorder(
            borderRadius:
<<<<<<< HEAD
            BorderRadius.circular(getWidth(15.0)),
=======
            BorderRadius.circular(getProportionateScreenWidth(15.0)),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          contentPadding: EdgeInsets.only(
<<<<<<< HEAD
            top: getHeight(38.0),
            left: getWidth(25.0),
            right: getWidth(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(getWidth(12.0)),
=======
            top: getProportionateScreenHeight(38.0),
            left: getProportionateScreenWidth(25.0),
            right: getProportionateScreenWidth(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(getProportionateScreenWidth(12.0)),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          filled: true,
          fillColor: Color(0xFFFFFFFF),
          focusedBorder: OutlineInputBorder(
            borderRadius:
<<<<<<< HEAD
            BorderRadius.circular(getWidth(12.0)),
=======
            BorderRadius.circular(getProportionateScreenWidth(12.0)),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
            borderSide: BorderSide(color:Colors.green,),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.red,
            ),
          ),
          labelText: widget.hint,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: TextStyle(
<<<<<<< HEAD
            fontSize: getWidth(16.0),
=======
            fontSize: getProportionateScreenWidth(16.0),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
            color: Color(0xFF677294),
          ),
        ),
        obscureText: widget.obscureText,
        keyboardType: widget.inputType,
        cursorColor: Color(0xFF000000),
        style: TextStyle(
<<<<<<< HEAD
          fontSize: getWidth(16.0),
=======
          fontSize: getProportionateScreenWidth(16.0),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          //color: HexColor('#3C3C43'),
        ),
        expands: false,
      ),
    );
  }

  String? _checkFieldEmpty(String? fieldContent) {
    //<-- add String? as a return type
    if (fieldContent!.isEmpty) {
      return 'Пожалуйста, заполните поле';
    } //else if (fieldContent.length < 3) {
      //return 'Минимум 3 символа';
      // } else if (widget.inputType == TextInputType.emailAddress) {
      //   if (!_isPassword(widget.controller!.text.trim())) {
      //     return 'Please, Enter a valid email';
      //   }
      // }
      //return null;
    //}
  }

  bool _isPassword(String input) {
    return RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input);
  }
}
