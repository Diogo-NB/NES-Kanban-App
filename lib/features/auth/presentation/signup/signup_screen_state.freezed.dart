// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupScreenState {
  AsyncValue<String?> get signupState => throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get confirmPassword => throw _privateConstructorUsedError;

  /// Create a copy of SignupScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupScreenStateCopyWith<SignupScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupScreenStateCopyWith<$Res> {
  factory $SignupScreenStateCopyWith(
          SignupScreenState value, $Res Function(SignupScreenState) then) =
      _$SignupScreenStateCopyWithImpl<$Res, SignupScreenState>;
  @useResult
  $Res call(
      {AsyncValue<String?> signupState,
      bool isPasswordVisible,
      String? email,
      String? password,
      String? confirmPassword});
}

/// @nodoc
class _$SignupScreenStateCopyWithImpl<$Res, $Val extends SignupScreenState>
    implements $SignupScreenStateCopyWith<$Res> {
  _$SignupScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupState = null,
    Object? isPasswordVisible = null,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(_value.copyWith(
      signupState: null == signupState
          ? _value.signupState
          : signupState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String?>,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupScreenStateImplCopyWith<$Res>
    implements $SignupScreenStateCopyWith<$Res> {
  factory _$$SignupScreenStateImplCopyWith(_$SignupScreenStateImpl value,
          $Res Function(_$SignupScreenStateImpl) then) =
      __$$SignupScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<String?> signupState,
      bool isPasswordVisible,
      String? email,
      String? password,
      String? confirmPassword});
}

/// @nodoc
class __$$SignupScreenStateImplCopyWithImpl<$Res>
    extends _$SignupScreenStateCopyWithImpl<$Res, _$SignupScreenStateImpl>
    implements _$$SignupScreenStateImplCopyWith<$Res> {
  __$$SignupScreenStateImplCopyWithImpl(_$SignupScreenStateImpl _value,
      $Res Function(_$SignupScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupState = null,
    Object? isPasswordVisible = null,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(_$SignupScreenStateImpl(
      signupState: null == signupState
          ? _value.signupState
          : signupState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String?>,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignupScreenStateImpl implements _SignupScreenState {
  const _$SignupScreenStateImpl(
      {this.signupState = const AsyncData(null),
      this.isPasswordVisible = false,
      this.email,
      this.password,
      this.confirmPassword});

  @override
  @JsonKey()
  final AsyncValue<String?> signupState;
  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? confirmPassword;

  @override
  String toString() {
    return 'SignupScreenState(signupState: $signupState, isPasswordVisible: $isPasswordVisible, email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupScreenStateImpl &&
            (identical(other.signupState, signupState) ||
                other.signupState == signupState) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signupState, isPasswordVisible,
      email, password, confirmPassword);

  /// Create a copy of SignupScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupScreenStateImplCopyWith<_$SignupScreenStateImpl> get copyWith =>
      __$$SignupScreenStateImplCopyWithImpl<_$SignupScreenStateImpl>(
          this, _$identity);
}

abstract class _SignupScreenState implements SignupScreenState {
  const factory _SignupScreenState(
      {final AsyncValue<String?> signupState,
      final bool isPasswordVisible,
      final String? email,
      final String? password,
      final String? confirmPassword}) = _$SignupScreenStateImpl;

  @override
  AsyncValue<String?> get signupState;
  @override
  bool get isPasswordVisible;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get confirmPassword;

  /// Create a copy of SignupScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupScreenStateImplCopyWith<_$SignupScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
