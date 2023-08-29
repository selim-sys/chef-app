import 'package:chefapp/screens/login-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom-button.dart';
import '../widgets/custom-textformfield.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  var formkey = GlobalKey<FormState>();
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
                        'Welcome',
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
                    SizedBox(
                      height: 32,
                    ),
                    CustomTextFormField(
                      label: 'Confirm Password',
                      validator: (val){
                        if(val!.isEmpty){
                          return 'confirm your password';
                        }
                      },
                    ),
                    SizedBox(height: 64,),
                    CustomButton(text: 'Sign up',onPressed: (){
                      if(formkey.currentState!.validate()){

                      }
                    },),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.grey,
                        ),),
                        TextButton(onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));
                        }, child: Text('Sign In',style: TextStyle(
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
