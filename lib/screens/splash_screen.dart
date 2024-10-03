import 'package:flutter/material.dart';
import 'package:my_chat_app/screens/onboarding/on_boarding_screen.dart';

import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /* To prevent the default splash screen go to android/app/res/styles.xml
    * and change the following
    *     <!--<item name="android:windowBackground">@drawable/launch_background</item>-->
        <item name= "android:windowDisablePreview">true</item>
        <item name= "android:windowIsTranslucent">true</item>
        * */

    // Navigate to ChatScreen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/splash_image.png',
            width: 500,
          ),
        ),
      ),
    );
  }
}
