import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:testproject/drift/database.dart';

class LocalAuth extends StatefulWidget {
  const LocalAuth({super.key});

  @override
  State<LocalAuth> createState() => _LocalAuthState();
}

class _LocalAuthState extends State<LocalAuth> {
  bool isAuth = false;

  void _checkBiometric() async {
    // check for biometric availability
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("error biome trics $e");
    }

    print("biometric is available: $canCheckBiometrics");

    // enumerate biometric technologies
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics(
      
      );
    } catch (e) {
      print("error enumerate biometrics $e");
    }

    print("following biometrics are available");
    if (availableBiometrics!.isNotEmpty) {
      for (var ab in availableBiometrics) {
        
        print("\ttech: $ab");
      }
    } else {
      print("no biometrics are available");
    }

    // authenticate with biometrics
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason: 'Touch your finger on the sensor to login',
          options: const AuthenticationOptions());
    } catch (e) {
      print("error using biometric auth: $e");
    }
    setState(() {
      isAuth = authenticated ? true : false;
    });

    print("authenticated: $authenticated");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: double.infinity,
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Check Auth"),
        onPressed: () {
          // MyDatabase();
          _checkBiometric();
        },
      ),
    );
  }
}
