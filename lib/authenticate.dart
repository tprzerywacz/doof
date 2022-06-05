import 'package:doof_app/register.dart';
import 'package:doof_app/sing_in.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = false;
  void changeFromSignInToRegister(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn(changeFromSignInToRegister: changeFromSignInToRegister);
    }
    else{
      return Register(changeFromSignInToRegister: changeFromSignInToRegister);
    }
    
  }
}