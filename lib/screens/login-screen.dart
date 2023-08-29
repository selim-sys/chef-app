import 'package:chefapp/constants.dart';
import 'package:chefapp/screens/register-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom-button.dart';
import '../widgets/custom-textformfield.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  var formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 222,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/background_image 1.png')),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 92.0),
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: kPrimaryFont,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 103,
                    ),
                    CustomTextFormField(
                      label: 'E-mail',validator: (val){
                        if(val!.isEmpty){
                          return 'enter your e-mail';
                        }
                    },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CustomTextFormField(
                      label: 'Password',
                      suffixIcon: CupertinoIcons.eye_slash,
                      validator: (val){
                        if(val!.isEmpty){
                          return 'enter your password';
                        }
                      },
                    ),
                    TextButton(
                      child: Text(
                        'forgot password ?',
                        style: TextStyle(color: Color(0XFFB5B7B8)),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    ),
                    SizedBox(height: 64,),
                    CustomButton(text: 'Sign in',onPressed: (){
                      if(formkey.currentState!.validate()){

                      }
                    },),
                    SizedBox(height: 72,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?',style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.grey,
                        ),),
                        TextButton(onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterScreen(),));
                        }, child: Text('Sign Up',style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


