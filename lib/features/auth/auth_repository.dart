import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/chopper.dart';
import 'package:nes_kanban_app/features/auth/auth_service.dart';
import 'package:nes_kanban_app/features/auth/signin_dto.dart';
import 'package:nes_kanban_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    service: ref.read(chopperProvider).getService<AuthService>(),
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
    required String username,
    required String password,
  }) async {
    final response = await _service.signin(SignInDto(
      username: username,
      password: password,
    ));

    if (response.statusCode == 401 || response.statusCode == 404) {
      throw ArgumentError('Invalid username or password');
    }

    if (response.statusCode != 200) {
      throw Exception('Failed to sign in');
    }

    final token = response.body['access_token'];

    await _prefs.setString('jwt', token);

    return token;
  }
}
