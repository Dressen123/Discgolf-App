import 'package:firebase_auth/firebase_auth.dart';
import 'package:dg_marketplace/models/user.dart'
    as custom_user; // Alias to avoid conflicts

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on Firebase User
  custom_user.User? _userFromFirebaseUser(User? user) {
    if (user == null) return null;
    return custom_user.User(uid: user.uid);
  }

  // auth change user stream

  Stream<custom_user.User?> get user {
    return _auth
        .authStateChanges()
        //.map((custom_user.User? user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // Sign in anonymously
  Future<custom_user.User?> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print('Error signing in anonymously: $e');
      return null;
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign up with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out function
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
