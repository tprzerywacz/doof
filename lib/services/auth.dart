import 'package:doof_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User? user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Stream<MyUser?> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    //.map((User? user) => _userFromFirebaseUser(user));
  }

  //sign in
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User newUser = result.user!;
      return _userFromFirebaseUser(newUser);
      //User user = result.user;
    }
    catch(e){
      //print(e.toString());
      return null;

    }
  }

  // register
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User newUser = result.user!;
      return _userFromFirebaseUser(newUser);
      //User user = result.user;
    }
    catch(e){
      //print(e.toString());
      return null;

    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      //print(e.toString());
      return null;

    }
  }

}