import 'package:chefapp/view/constants/assets.dart';
import 'package:chefapp/view/constants/colors.dart';
import 'package:chefapp/view/screens/auth/register-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/data.dart';
import '../../../view_model/cubits/login-cubit/login_cubit.dart';
import '../../widgets/custom-button.dart';
import '../../widgets/custom-textformfield.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: loginCubit.formKey,
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
                        'Welcome Back',
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
                      textEditingController: loginCubit.emailController,
                      isPassword: false,
                      textInputType: TextInputType.emailAddress,
                      label: 'E-mail',
                      validator: (val){
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
                      textEditingController: loginCubit.passwordController,
                      isPassword: loginCubit.isOb,
                      textInputType: TextInputType.visiblePassword,
                      label: 'Password',
                      suffixIcon: loginCubit.isOb ? CupertinoIcons.eye_slash: CupertinoIcons.eye,
                      suffixPressed: (){
                        setState(() {
                          loginCubit.isOb = !loginCubit.isOb;
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
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: const Text(
                        'forgot password ?',
                        style: TextStyle(color: Color(0XFFB5B7B8)),
                      ),
                    ),
                    const SizedBox(height: 64,),
                    CustomButton(text: 'Sign in',onPressed: (){
                      if(loginCubit.formKey.currentState!.validate()){

                      }
                    },),
                    const SizedBox(height: 72,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?',style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.grey,
                        ),),
                        TextButton(onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterScreen(),));
                        }, child: const Text('Sign Up',style: TextStyle(
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
