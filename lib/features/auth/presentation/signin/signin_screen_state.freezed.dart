// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SigninScreenState {
  AsyncValue<String?> get signinState => throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  /// Create a copy of SigninScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SigninScreenStateCopyWith<SigninScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigninScreenStateCopyWith<$Res> {
  factory $SigninScreenStateCopyWith(
          SigninScreenState value, $Res Function(SigninScreenState) then) =
      _$SigninScreenStateCopyWithImpl<$Res, SigninScreenState>;
  @useResult
  $Res call(
      {AsyncValue<String?> signinState,
      bool isPasswordVisible,
      String? email,
      String? password});
}

/// @nodoc
class _$SigninScreenStateCopyWithImpl<$Res, $Val extends SigninScreenState>
    implements $SigninScreenStateCopyWith<$Res> {
  _$SigninScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SigninScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signinState = null,
    Object? isPasswordVisible = null,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      signinState: null == signinState
          ? _value.signinState
          : signinState // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SigninScreenStateImplCopyWith<$Res>
    implements $SigninScreenStateCopyWith<$Res> {
  factory _$$SigninScreenStateImplCopyWith(_$SigninScreenStateImpl value,
          $Res Function(_$SigninScreenStateImpl) then) =
      __$$SigninScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<String?> signinState,
      bool isPasswordVisible,
      String? email,
      String? password});
}

/// @nodoc
class __$$SigninScreenStateImplCopyWithImpl<$Res>
    extends _$SigninScreenStateCopyWithImpl<$Res, _$SigninScreenStateImpl>
    implements _$$SigninScreenStateImplCopyWith<$Res> {
  __$$SigninScreenStateImplCopyWithImpl(_$SigninScreenStateImpl _value,
      $Res Function(_$SigninScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SigninScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signinState = null,
    Object? isPasswordVisible = null,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$SigninScreenStateImpl(
      signinState: null == signinState
          ? _value.signinState
          : signinState // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$SigninScreenStateImpl implements _SigninScreenState {
  const _$SigninScreenStateImpl(
      {this.signinState = const AsyncData(null),
      this.isPasswordVisible = false,
      this.email,
      this.password});

  @override
  @JsonKey()
  final AsyncValue<String?> signinState;
  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'SigninScreenState(signinState: $signinState, isPasswordVisible: $isPasswordVisible, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninScreenStateImpl &&
            (identical(other.signinState, signinState) ||
                other.signinState == signinState) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, signinState, isPasswordVisible, email, password);

  /// Create a copy of SigninScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninScreenStateImplCopyWith<_$SigninScreenStateImpl> get copyWith =>
      __$$SigninScreenStateImplCopyWithImpl<_$SigninScreenStateImpl>(
          this, _$identity);
}

abstract class _SigninScreenState implements SigninScreenState {
  const factory _SigninScreenState(
      {final AsyncValue<String?> signinState,
      final bool isPasswordVisible,
      final String? email,
      final String? password}) = _$SigninScreenStateImpl;

  @override
  AsyncValue<String?> get signinState;
  @override
  bool get isPasswordVisible;
  @override
  String? get email;
  @override
  String? get password;

  /// Create a copy of SigninScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SigninScreenStateImplCopyWith<_$SigninScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
