import 'package:flutter/material.dart';
import 'package:pat_app/res/custom_colors.dart';
import 'package:pat_app/utils/authentication.dart';
import 'package:pat_app/widgets/google_sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightTeal,
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
                        'assets/doctor.png',
                        height: 250,
                        color: CustomColors.blue,
                      ),
                    ),
                    SizedBox(height: 60),
                    Text(
                      'ASK',
                      style: TextStyle(
                        color: CustomColors.lightBlue,
                        fontSize: 60,
                        fontFamily: 'Hope',
                      ),
                    ),
                    Text(
                      'P A T',
                      style: TextStyle(
                        color: CustomColors.blue,
                        fontSize: 80,
                        fontFamily: 'Hope',
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
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
}