import 'package:chefapp/view/constants/assets.dart';
import 'package:chefapp/view/screens/auth/login-screen.dart';
import 'package:flutter/material.dart';

import '../widgets/language_button.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
              image: AssetImage('assets/images/bg 1.png'))
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MyAssets.logo),
            const SizedBox(height: 16,),
            const Text('Welcome to Chef App',style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700
            ),),
            const SizedBox(height: 54,),
            const Text('Please choose your language',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400
            ),),
            const SizedBox(height: 120,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LanguageButton(text: 'English', onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                }),
                LanguageButton(text: 'العربية',onTap: (){},),
              ],
            )
          ],
        )
      ),
    );
  }
}

