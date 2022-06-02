import 'dart:math';

import 'package:doof_app/services/auth.dart';
import 'package:doof_app/styles.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  //const SignIn({Key? key}) : super(key: key);
  final Function changeFromSignInToRegister;
  SignIn({required this.changeFromSignInToRegister});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 160, 130),
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: (){
              widget.changeFromSignInToRegister();
            },
             icon: Icon(Icons.person, color: Colors.white,),
              label: Text('Register', style: TextStyle(color: Colors.white),)
              
              )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecorator.copyWith(hintText: 'E-mail'),
                validator: (String? val) => val != null && val.isEmpty ? 'Enter e-mail' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecorator.copyWith(hintText: 'Password'),
                validator: (String? val) => val != null && val.length < 6 ? 'Enter password 6+ long' : null,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(orange),
                textStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 18),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(44.0),
                    side: const BorderSide(color: orange)),
                ),
                ),
                

                child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 22.0),
                child: Text('Sign in'),
                ),
                
                onPressed: () async {
                  if (_formKey.currentState!.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null){
                      setState(() {
                        error = 'Could not log in using these credentials';
                      });
                    }
                    
                    
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red)
                )

            ],
            ),
        ),
        ),
      );
    
  }
}