import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<UserCredential> signin({
    required String email,
    required String password,
  }) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Returns the signed in user's token, null if not signed in.
  Future<String?> getToken({bool forceRefresh = false}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    final token = await user.getIdToken(forceRefresh);
    return token;
  }

  Future<UserCredential> signup({
    required String email,
    required String password,
  }) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signout() {
    return FirebaseAuth.instance.signOut();
  }
}
