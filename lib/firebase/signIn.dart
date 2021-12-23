import 'package:flutter/material.dart';
import 'package:sprout/firebase/signInButton.dart';
import 'package:sprout/model_data/colors.dart';

import 'authentication.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: 
              Center(
                child: FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      return GoogleSignInButton();
                    }
                    return CircularProgressIndicator(
                      color: Shade.moss,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.amber,
                      ),
                    );
                  },
                ),
              ),
          ),
        ),
    
    );
  }
}