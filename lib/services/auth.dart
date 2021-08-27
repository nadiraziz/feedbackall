import 'package:feedback/screens/home/home.dart';
import 'package:feedback/services/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);


  // create user object based on firebased user
  UserModel? _fromFirebaseUser(User user)
  {
  return user != null ? UserModel(uid: user.uid) : null;
  }



  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // sign in email and password
  Future<dynamic> signIn({required String email, required String password}) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      HomePage();
      return _fromFirebaseUser(user!);

    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  // sign in email and password
  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  // sign out
  Future signOut() async{
    try{
      await _firebaseAuth.signOut();
      return null;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}
