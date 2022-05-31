import 'package:doof_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  myUser _userFromFirebaseUser(User user){
    return myUser(uid: user.uid);
  }

  // register
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      //User user = result.user;
    }
    catch(e){

    }
  }

}