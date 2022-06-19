// ignore_for_file: unnecessary_const

import 'package:doof_app/services/auth.dart';
import 'package:doof_app/styles.dart';
import 'package:flutter/material.dart';

enum PgState { welcome, login, register, profile }

class SignUpModal extends StatefulWidget {
  const SignUpModal({
    Key? key,
    required this.openSignInModal,
  }) : super(key: key);

  final ValueSetter<BuildContext> openSignInModal;

  @override
  State<SignUpModal> createState() => _SignUpModalState();
}

class _SignUpModalState extends State<SignUpModal> {
  String error = '';
  int _pageNumber = 1;
  final email = TextEditingController();
  final password = TextEditingController();
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (_pageNumber == 1) {
      child = _buildCredentials(context);
    } else {
      child = _buildProfile(context);
    }

    return Form(
      key: _formKey,
      child: child,
    );
  }

  Widget _buildCredentials(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0, bottom: 0),
            child: Text(
              'Sign up',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
          child: Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "E-mail address",
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            validator: (String? val) => val != null && val.length < 6 ? 'Enter password 6+ long' : null,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline_sharp),
              filled: true,
            ),
            controller: email,
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 15),
            child: Text(
              "Password",
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.key_sharp),
              filled: true,
            ),
            controller: password,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => _goToPage(2),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Icon(Icons.navigate_next_sharp)
                ],
              ),
              const Text(
                'or',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  widget.openSignInModal(context);
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfile(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0, bottom: 0),
            child: Text(
              'Sign up',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
          child: Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Name",
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
            ),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 15),
            child: Text(
              "Surname",
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
            ),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 15),
            child: Text(
              "Gender",
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
            ),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 15),
            child: Text(
              "Age",
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
            ),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 15),
            child: Text(
              "Number of people in the household",
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              _signUpButton(context),
              const Text(
                'or',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  widget.openSignInModal(context);
                },
                child: const Text(
                  'Sign in',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Text(error, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 12.0),
      ],
    );
  }

  Widget _signUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(customOrange),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 18),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(44.0), side: const BorderSide(color: customOrange)),
          ),
        ),
        onPressed: _attemptSignUp,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 80),
          child: Text("Sign up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  void _goToPage(int pageNumber) {
    setState(() {
      _pageNumber = pageNumber;
    });
  }

  void _attemptSignUp() async {
    if (_formKey.currentState!.validate()) {
      dynamic result = await _auth.registerWithEmailAndPassword(email.text, password.text);
      if (result == null) {
        setState(() {
          error = 'Enter valid email';
        });
      } else {
        if (mounted) Navigator.of(context).pop();
      }
    }
  }
}
