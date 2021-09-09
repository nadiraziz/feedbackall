
import 'package:feedback/services/User.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  // user model
  UserModel? _userFromFirebase(auth.User? user){
    if(user == null){
      return null;
    }
    return UserModel(user.uid, user.email);
  }

  // user model calling
  Stream<UserModel?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }
// sign in user
  Future<UserModel?> signInWithEmailPassword(String email, String password,) async{
    final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credential.user);

  }

// create user
  Future<UserModel?> createUserWithEmailPassword(String email, String password,) async{
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credential.user);
  }


  // sign in out
  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }


}
