import 'package:chefapp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField(
      {super.key, required this.label,this.suffixIcon,this.validator});
  final String label;
  IconData? suffixIcon = CupertinoIcons.eye_slash;
   String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF9D9FA0)),
              borderRadius: BorderRadius.circular(8)
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF9D9FA0)),
              borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
          ),
          label: Text(label),
          contentPadding: EdgeInsets.all(16),
          suffixIcon: IconButton(onPressed: (){}, icon: Icon(suffixIcon),)
      ),

    );
  }
}