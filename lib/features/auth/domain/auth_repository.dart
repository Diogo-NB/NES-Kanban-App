import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/data/auth_service.dart';
import 'package:nes_kanban_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    service: AuthService(),
    prefs: ref.read(sharedPrefsProvider),
  );
});

class AuthRepository {
  final AuthService _service;
  final SharedPreferencesWithCache _prefs;

  AuthRepository({
    required AuthService service,
    required SharedPreferencesWithCache prefs,
  })  : _service = service,
        _prefs = prefs;

  Future<String> signin({
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

      return token;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${(e.code, e.message)}');
      rethrow;
    }
  }
}
