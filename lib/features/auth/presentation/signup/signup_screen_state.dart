import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_screen_state.freezed.dart';

@freezed
class SignupScreenState with _$SignupScreenState {
  const factory SignupScreenState({
    @Default(AsyncData(null)) AsyncValue<String?> signupState,
    @Default(false) bool isPasswordVisible,
    String? email,
    String? password,
    String? confirmPassword,
  }) = _SignupScreenState;
}
