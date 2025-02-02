import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/data/auth_service.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    service: AuthService(),
  );
});

class AuthRepository {
  final AuthService _service;

  AuthRepository({required AuthService service}) : _service = service;

  Future<String?> signin({
    required String email,
    required String password,
  }) async {
    try {
      await _service.signin(
        email: email,
        password: password,
      );

      final token = await _service.getToken();

      if (token == null) {
        throw Exception('Failed to get token');
      }

      return null;
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return 'Authentication failed. Please try again.';
    }
  }

  Future<void> signout() async {
    await _service.signout();
  }
}

String _handleAuthError(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return 'Invalid email address';
    case 'user-not-found':
      return 'No user found with this email';
    case 'wrong-password':
      return 'Incorrect password';
    case 'user-disabled':
      return 'This account has been disabled';
    case 'invalid-credential':
      return 'Invalid Email or Password';
    default:
      return 'Authentication failed. Please try again.';
  }
}
