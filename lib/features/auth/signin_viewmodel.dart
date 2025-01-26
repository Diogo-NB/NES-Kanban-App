import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/auth_repository.dart';

@immutable
class SigninScreenState {
  final bool isPasswordVisible;
  final String? username, password;

  const SigninScreenState({
    this.isPasswordVisible = false,
    this.username,
    this.password,
  });

  SigninScreenState copyWith({
    bool? isPasswordVisible,
    String? username,
    String? password,
  }) {
    return SigninScreenState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

class SigninScreenViewModel extends AutoDisposeNotifier<SigninScreenState> {
  late final AuthRepository _authRepository;

  @override
  SigninScreenState build() {
    _authRepository = ref.read(authRepositoryProvider);

    return SigninScreenState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void saveFields({String? username, String? password}) {
    state = state.copyWith(
      username: username,
      password: password,
    );
  }

  Future<void> submit() async {
    try {
      await _authRepository.signin(
        username: state.username!,
        password: state.password!,
      );
    } catch (e) {
      print(e);
    }
  }
}

final signinScreenViewModel =
    NotifierProvider.autoDispose<SigninScreenViewModel, SigninScreenState>(() {
  return SigninScreenViewModel();
});
