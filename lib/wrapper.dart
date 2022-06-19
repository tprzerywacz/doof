import 'package:doof_app/authentication/authenticate.dart';
import 'package:doof_app/default_screens/first_page.dart';
import 'package:doof_app/default_screens/home.dart';
import 'package:doof_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    //print(user.uid);

    if (user == null){
      return const FirstPage();
      // return const Authenticate();
    }
    else{
      return const MyStatefulWidget();
    }

    
  }
}