import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/domain/auth_repository.dart';
import 'package:nes_kanban_app/features/auth/presentation/signup/signup_screen_state.dart';

class SignupScreenViewModel extends AutoDisposeNotifier<SignupScreenState> {
  late final AuthRepository _authRepository;

  @override
  SignupScreenState build() {
    _authRepository = ref.read(authRepositoryProvider);

    return SignupScreenState();
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

  void saveConfirmPassword(String? confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  void resetErrorMessage() {
    if (state.signupState.hasError) {
      state = state.copyWith(signupState: const AsyncValue.data(null));
    }
  }

  Future<bool> submit() async {
    state = state.copyWith(signupState: const AsyncValue.loading());

    if (state.password != state.confirmPassword) {
      state = state.copyWith(
        signupState: AsyncValue.error(
          'Passwords do not match',
          StackTrace.current,
        ),
      );

      return false;
    }

    final result = await _authRepository.signup(
      email: state.email!,
      password: state.password!,
    );

    state = state.copyWith(
      signupState: result == null
          ? AsyncValue.data(result)
          : AsyncValue.error(result, StackTrace.current),
    );

    return result == null;
  }
}

final signupScreenViewModel =
    NotifierProvider.autoDispose<SignupScreenViewModel, SignupScreenState>(
        SignupScreenViewModel.new);
