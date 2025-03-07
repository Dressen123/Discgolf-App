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

  // Sign out function
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
