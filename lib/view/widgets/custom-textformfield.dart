import 'package:chefapp/view/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField(
      {super.key,
        required this.label,
        required this.isPassword,
        this.suffixIcon,
        this.validator,
        required this.textInputType,
        this.textEditingController,
        this.suffixPressed
      });
  final String label;
  IconData? suffixIcon = CupertinoIcons.eye_slash;
   String? Function(String?)? validator;
   final TextInputType textInputType;
   TextEditingController? textEditingController;
   bool isPassword;
   VoidCallback? suffixPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: textEditingController,
      keyboardType: textInputType,
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
              borderSide: BorderSide(color: MyColors.mainColor),
              borderRadius: BorderRadius.circular(8),
          ),
          label: Text(label),
          contentPadding: EdgeInsets.all(16),
          suffixIcon: IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon),)
      ),

    );
  }
}