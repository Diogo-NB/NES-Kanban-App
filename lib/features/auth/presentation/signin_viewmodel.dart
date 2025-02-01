import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/domain/auth_repository.dart';
import 'package:nes_kanban_app/features/auth/presentation/signin_screen_state.dart';

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

  void saveEmail(String? email) {
    state = state.copyWith(email: email);
  }

  void savePassword(String? password) {
    state = state.copyWith(password: password);
  }

  void resetErrorMessage() {
    if (state.signinState.hasError) {
      state = state.copyWith(signinState: const AsyncValue.data(null));
    }
  }

  Future<void> submit() async {
    state = state.copyWith(signinState: const AsyncValue.loading());
    final result = await _authRepository.signin(
      email: state.email!,
      password: state.password!,
    );

    state = state.copyWith(
      signinState: result == null
          ? AsyncValue.data(result)
          : AsyncValue.error(result, StackTrace.current),
    );
  }
}

final signinScreenViewModel =
    NotifierProvider.autoDispose<SigninScreenViewModel, SigninScreenState>(
        SigninScreenViewModel.new);
