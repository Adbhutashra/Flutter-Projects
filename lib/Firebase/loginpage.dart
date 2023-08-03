import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testproject/Firebase/fire_auth.dart';
import 'package:testproject/Firebase/google_sign_in_button.dart';
import 'package:testproject/Firebase/profilepage.dart';
import 'package:testproject/Firebase/register.dart';
import 'package:testproject/Firebase/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/images/firebase_logo.png',
                        height: 160,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'FlutterFire',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'Authentication',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Firebase.initializeApp(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
    // return GestureDetector(
    //   onTap: () {
    //     _focusEmail.unfocus();
    //     _focusPassword.unfocus();
    //   },
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Firebase Authentication'),
    //     ),
    //     body: FutureBuilder(
    //       future: _initializeFirebase(),
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.done) {
    //           return Padding(
    //             padding: const EdgeInsets.only(left: 24.0, right: 24.0),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(bottom: 24.0),
    //                   child: Text(
    //                     'Login',
    //                     style: Theme.of(context).textTheme.headline1,
    //                   ),
    //                 ),
    //                 Form(
    //                   key: _formKey,
    //                   child: Column(
    //                     children: <Widget>[
    //                       TextFormField(
    //                         controller: _emailTextController,
    //                         focusNode: _focusEmail,
    //                         validator: (value) => Validator.validateEmail(
    //                           email: value!,
    //                         ),
    //                         decoration: InputDecoration(
    //                           hintText: "Email",
    //                           errorBorder: UnderlineInputBorder(
    //                             borderRadius: BorderRadius.circular(6.0),
    //                             borderSide: BorderSide(
    //                               color: Colors.red,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       SizedBox(height: 8.0),
    //                       TextFormField(
    //                         controller: _passwordTextController,
    //                         focusNode: _focusPassword,
    //                         obscureText: true,
    //                         validator: (value) => Validator.validatePassword(
    //                           password: value!,
    //                         ),
    //                         decoration: InputDecoration(
    //                           hintText: "Password",
    //                           errorBorder: UnderlineInputBorder(
    //                             borderRadius: BorderRadius.circular(6.0),
    //                             borderSide: BorderSide(
    //                               color: Colors.red,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       SizedBox(height: 24.0),
    //                       _isProcessing
    //                           ? CircularProgressIndicator()
    //                           : Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 Expanded(
    //                                   child: ElevatedButton(
    //                                     onPressed: () async {
    //                                       _focusEmail.unfocus();
    //                                       _focusPassword.unfocus();

    //                                       if (_formKey.currentState!
    //                                           .validate()) {
    //                                         setState(() {
    //                                           _isProcessing = true;
    //                                         });

    //                                         User? user = await FireAuth
    //                                             .signInUsingEmailPassword(
    //                                               context: context,
    //                                           email: _emailTextController.text,
    //                                           password:
    //                                               _passwordTextController.text,
    //                                         );

    //                                         setState(() {
    //                                           _isProcessing = false;
    //                                         });

    //                                         if (user != null) {
    //                                           Navigator.of(context)
    //                                               .pushReplacement(
    //                                             MaterialPageRoute(
    //                                               builder: (context) =>
    //                                                   ProfilePage(user: user),
    //                                             ),
    //                                           );
    //                                         }
    //                                       }
    //                                     },
    //                                     child: Text(
    //                                       'Sign In',
    //                                       style: TextStyle(color: Colors.white),
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 SizedBox(width: 24.0),
    //                                 Expanded(
    //                                   child: ElevatedButton(
    //                                     onPressed: () {
    //                                       Navigator.of(context).push(
    //                                         MaterialPageRoute(
    //                                           builder: (context) =>
    //                                               RegisterPage(),
    //                                         ),
    //                                       );
    //                                     },
    //                                     child: Text(
    //                                       'Register',
    //                                       style: TextStyle(color: Colors.white),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ],
    //                             )
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           );
    //         }

    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
