import 'package:chefapp/view/constants/assets.dart';
import 'package:chefapp/view/constants/colors.dart';
import 'package:chefapp/view_model/cubits/register-cubit/register_cubit.dart';
import 'package:chefapp/view/screens/auth/login-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/data.dart';
import '../../widgets/custom-button.dart';
import '../../widgets/custom-textformfield.dart';


class RegisterScreen extends StatefulWidget {
   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = BlocProvider.of<RegisterCubit>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: registerCubit.formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(MyAssets.top)),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 92.0),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
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
                    const SizedBox(
                      height: 103,
                    ),
                    CustomTextFormField(
                      isPassword: false,
                      textEditingController: registerCubit.emailController,
                      textInputType: TextInputType.emailAddress,
                      label: 'E-mail',validator: (val){
                      if(val!.isEmpty){
                        return 'enter your e-mail';
                      }
                      else if (!RegExp(validationEmail)
                          .hasMatch(val.trim())) {
                        return 'email is not valid!';
                      } else {
                        return null;
                      }
                    },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomTextFormField(
                      textEditingController: registerCubit.passwordController,
                      isPassword: registerCubit.isOb,
                      textInputType: TextInputType.visiblePassword,
                      label: 'Password',
                      suffixIcon: registerCubit.isOb ? CupertinoIcons.eye_slash: CupertinoIcons.eye,
                      suffixPressed: (){
                        setState(() {
                          registerCubit.isOb = !registerCubit.isOb;
                        });
                      },
                      validator: (val){
                        if(val!.isEmpty){
                          return 'enter your password';
                        }
                        else if (!RegExp(validationPassword)
                            .hasMatch(val)) {
                          return 'password is not valid!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomTextFormField(
                      isPassword: true,
                      textInputType: TextInputType.visiblePassword,
                      label: 'Confirm Password',
                      validator: (val){
                        if(val!.isEmpty){
                          return 'confirm your password';
                        }
                        if(val != registerCubit.passwordController.text){
                          return 'password doesn\'t match';
                        }
                      },
                    ),
                    const SizedBox(height: 64,),
                    CustomButton(text: 'Sign up',onPressed: (){
                      if(registerCubit.formKey.currentState!.validate()){

                      }
                    },),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?',style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.grey,
                        ),),
                        TextButton(onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));
                        }, child: const Text('Sign In',style: TextStyle(
                          color: MyColors.mainColor,
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
