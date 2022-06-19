import 'package:doof_app/authentication/authenticate.dart';
import 'package:doof_app/authentication/sing_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles.dart';

enum PgState { welcome, login, register, profile }

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  PgState pgState = PgState.welcome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SvgPicture.asset(
            'assets/background.svg',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _getPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPage() {
    switch (pgState) {
      case PgState.welcome:
        return _welcomePage();
      case PgState.login:
        return _loginPage();
      case PgState.register:
        return _registerPage();
      case PgState.profile:
        return _profilePage();
    }
  }

  Widget _welcomePage() {
    return Column(
      children: [
        _signInButton(),
        _signUpButton(),
      ],
    );
  }

  Widget _loginPage() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
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
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => {
                          setState(() {
                            pgState = PgState.register;
                          })
                        }),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _registerPage() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key_sharp),
                filled: true,
              ),
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
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () => {
                              setState(() {
                                pgState = PgState.profile;
                              })
                            }),
                            const Icon(Icons.navigate_next_sharp)
                  ],
                ),
                const Text(
                  'or',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => {
                          setState(() {
                            pgState = PgState.login;
                          })
                        }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profilePage() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
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
          ),const SizedBox(
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
          ),const SizedBox(
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
                _signUpButton(),
                const Text(
                  'or',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => {
                          setState(() {
                            pgState = PgState.login;
                          })
                        }),
              ],
            ),
          ),
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
                borderRadius: BorderRadius.circular(44.0),
                side: const BorderSide(color: primaryColor)),
          ),
        ),
        onPressed: () {
          if (pgState != PgState.login) {
            setState(() {
              pgState = PgState.login;
            });
          }
          else
          {
            print('Authenticate');
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 80),
          child: Text("Sign in",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
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
                borderRadius: BorderRadius.circular(44.0),
                side: const BorderSide(color: customOrange)),
          ),
        ),
        onPressed: () {
          setState(() {
            if (pgState != PgState.register) {
            setState(() {
              pgState = PgState.register;
            });
          }
          else
          {
            pgState = PgState.profile;
          }});
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 80),
          child: Text("Sign up",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
