import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:testproject/Chat%20Application/constants/color_constants.dart';
import 'package:testproject/Chat%20Application/pages/home_page.dart';
import 'package:testproject/Chat%20Application/pages/login_page.dart';
import 'package:testproject/Chat%20Application/providers/auth_provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorConstants.themeColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/app_icon.png",
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              Container(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: ColorConstants.buttonColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
