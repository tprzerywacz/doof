import 'package:doof_app/register.dart';
import 'package:doof_app/sing_in.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Register(),
    );
    
  }
}