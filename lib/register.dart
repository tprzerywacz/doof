import 'package:flutter/material.dart';
import 'package:doof_app/services/auth.dart';

class Register extends StatefulWidget {
  //const Register({Key? key}) : super(key: key);
  final Function changeFromSignInToRegister;
  Register({required this.changeFromSignInToRegister});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Sign up'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: (){
              widget.changeFromSignInToRegister();
            },
             icon: Icon(Icons.person),
              label: Text('Sign in')
              )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (String? val) => val != null && val.isEmpty ? 'Enter e-mail' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (String? val) => val != null && val.length < 6 ? 'Enter password 6+ long' : null,

                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                child: Text('Register',
                style: TextStyle(color: Colors.white),
                ),
                
                onPressed: () async {
                  if (_formKey.currentState!.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null){
                      setState(() {
                        error = 'Enter valid email';
                      });
                    }
                    else{
                      print("signed in");
                      //print(result.uid);
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