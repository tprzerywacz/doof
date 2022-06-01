import 'package:doof_app/services/auth.dart';
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

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: (){
              widget.changeFromSignInToRegister();
            },
             icon: Icon(Icons.person),
              label: Text('Register')
              )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Sign in',
                style: TextStyle(color: Colors.white),
                ),
                
                onPressed: () async {
                  print(email);
                  print(password);
                },
              )

            ],
            ),
        ),
        ),
      );
    
  }
}