import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_screen_state.freezed.dart';

@freezed
class SigninScreenState with _$SigninScreenState {
  const factory SigninScreenState({
    @Default(AsyncData(null)) AsyncValue<String?> signinState,
    @Default(false) bool isPasswordVisible,
    String? email,
    String? password,
  }) = _SigninScreenState;
}
