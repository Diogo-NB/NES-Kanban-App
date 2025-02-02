import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nes_kanban_app/features/auth/data/auth_service.dart';

part 'auth_provider.freezed.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    String? token,
    User? user,
  }) = _AuthState;

  bool get isAuthenticated => token != null && user != null;
}

class AuthNotifier extends Notifier<AuthState> {
  final AuthService _service = AuthService();
  late StreamSubscription<User?> _stream;

  @override
  build() {
    _initFirebaseUserStateListener();
    ref.onDispose(_stream.cancel);
    return AuthState();
  }

  void _initFirebaseUserStateListener() {
    _stream = FirebaseAuth.instance.userChanges().listen((user) async {
      final token = await user?.getIdToken();
      state = state.copyWith(token: token, user: user);
    });
  }

  Future<void> refreshToken() async {
    await _service.getToken(forceRefresh: true);
  }
}
