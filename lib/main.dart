import 'package:doof_app/models/user.dart';
import 'package:doof_app/services/auth.dart';
import 'package:doof_app/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';
import 'models/user.dart';

const primaryColor = Color.fromARGB(255, 0, 160, 130);
const Color orange = Color.fromARGB(255, 240, 123, 79);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: const MaterialApp( 
        home: Wrapper(),
      ),
      );
  }
}