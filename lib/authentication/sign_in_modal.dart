import 'package:doof_app/services/auth.dart';
import 'package:doof_app/styles.dart';
import 'package:flutter/material.dart';

enum PgState { welcome, login, register, profile }

class SignInModal extends StatefulWidget {
  const SignInModal({
    Key? key,
    required this.openSignUpModal,
  }) : super(key: key);

  final ValueSetter<BuildContext> openSignUpModal;

  @override
  State<SignInModal> createState() => _SignInModalState();
}

class _SignInModalState extends State<SignInModal> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  final email = TextEditingController();
  final password = TextEditingController();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 0),
              child: Text(
                'Sign in',
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
              controller: email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_sharp),
                filled: true,
              ),
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
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key_sharp),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                _signInButton(),
                const Text(
                  'or',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    widget.openSignUpModal(context);
                  },
                  child: const Text(
                    'Sign up',
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
          Text(error, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }

  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 18),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(44.0), side: const BorderSide(color: primaryColor)),
          ),
        ),
        onPressed: _attemptSignIn,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 80),
          child: Text("Sign in", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  void _attemptSignIn() async {
    if (_formKey.currentState!.validate()) {
      dynamic result = await _auth.signInWithEmailAndPassword(email.text, password.text);
      if (result == null) {
        setState(() {
          error = 'Could not log in using these credentials';
        });
      } else {
        if (mounted) Navigator.of(context).pop();
      }
    }
  }
}
