import 'package:doof_app/widgets/bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles.dart';
import 'sign_in_modal.dart';
import 'sign_up_modal.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SvgPicture.asset(
            'assets/background.svg',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildButtons(context),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _signInButton(context),
        _signUpButton(context),
        const SizedBox(height: 42),
      ],
    );
  }

  Widget _signInButton(BuildContext context) {
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
        onPressed: () => _openSignInModal(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 80),
          child: Text("Sign in", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
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
        onPressed: () => _openSignUpModal(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 80),
          child: Text("Sign up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  void _openSignInModal(BuildContext context) {
    BottomModal.open(
      context: context,
      child: SignInModal(
        openSignUpModal: _openSignUpModal,
      ),
    );
  }

  void _openSignUpModal(BuildContext context) {
    BottomModal.open(
      context: context,
      child: SignUpModal(
        openSignInModal: _openSignInModal,
      ),
    );
  }
}
