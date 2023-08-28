import 'package:chefapp/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/language_button.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
              image: AssetImage('assets/images/bg 1.png'))
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/image47.png'),
            SizedBox(height: 16,),
            Text('Welcome to Chef App',style: TextStyle(
              fontFamily: kPrimaryFont,
              fontSize: 32,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 54,),
            Text('Please choose your language',style: TextStyle(
                fontFamily: kPrimaryFont,
                fontSize: 24,
                fontWeight: FontWeight.w400
            ),),
            SizedBox(height: 120,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LanguageButton(text: 'English', onTap: (){}),
                LanguageButton(text: 'العربية',onTap: (){},),
              ],
            )
          ],
        )
      ),
    );
  }
}

