import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  FirebaseAuth firebaseAuth =FirebaseAuth.instance;
 User?  get user =>firebaseAuth.currentUser;
 Stream<User?> get authstate =>firebaseAuth.authStateChanges();
  Future<void> signIn({required email,required pass})async{
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
  }
  Future<void> signUp({required email,required pass})async{
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pass);
    }catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          signIn(email: email, pass: pass);
        } else {
          print('Error: ${e.code}');
        }
      }
    }

  }
  Future<void> signingOut()async{
    await firebaseAuth.signOut();
  }
}




