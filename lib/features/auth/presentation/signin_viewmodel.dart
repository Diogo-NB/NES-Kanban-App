import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/domain/auth_repository.dart';

@immutable
class SigninScreenState {
  final bool isPasswordVisible;
  final String? username, password;
  final AsyncValue<String?> signinState;

  const SigninScreenState({
    this.isPasswordVisible = false,
    this.signinState = const AsyncValue.data(null),
    this.username,
    this.password,
  });

  SigninScreenState copyWith({
    bool? isPasswordVisible,
    String? username,
    String? password,
    AsyncValue<String?>? signinState,
  }) {
    return SigninScreenState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      username: username ?? this.username,
      password: password ?? this.password,
      signinState: signinState ?? this.signinState,
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

  void resetErrorMessage() {
    if (state.signinState.hasError) {
      state = state.copyWith(signinState: const AsyncValue.data(null));
    }
  }

  Future<void> submit() async {
    state = state.copyWith(signinState: const AsyncValue.loading());
    try {
      await _authRepository.signin(
        username: state.username!,
        password: state.password!,
      );
      state = state.copyWith(signinState: const AsyncValue.data(null));
    } catch (e, s) {
      state = state.copyWith(signinState: AsyncValue.error(e, s));
    }
  }
}

final signinScreenViewModel =
    NotifierProvider.autoDispose<SigninScreenViewModel, SigninScreenState>(
        SigninScreenViewModel.new);
