// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int themeCode) changeTheme,
    required TResult Function() switchTheme,
    required TResult Function() themeSwitched,
    required TResult Function(int languageCode) changeLanguage,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int themeCode)? changeTheme,
    TResult? Function()? switchTheme,
    TResult? Function()? themeSwitched,
    TResult? Function(int languageCode)? changeLanguage,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int themeCode)? changeTheme,
    TResult Function()? switchTheme,
    TResult Function()? themeSwitched,
    TResult Function(int languageCode)? changeLanguage,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_SwitchTheme value) switchTheme,
    required TResult Function(_ThemeSwitched value) themeSwitched,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ChangeTheme value)? changeTheme,
    TResult? Function(_SwitchTheme value)? switchTheme,
    TResult? Function(_ThemeSwitched value)? themeSwitched,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_SwitchTheme value)? switchTheme,
    TResult Function(_ThemeSwitched value)? themeSwitched,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStatesCopyWith<$Res> {
  factory $AppStatesCopyWith(AppStates value, $Res Function(AppStates) then) =
      _$AppStatesCopyWithImpl<$Res, AppStates>;
}

/// @nodoc
class _$AppStatesCopyWithImpl<$Res, $Val extends AppStates>
    implements $AppStatesCopyWith<$Res> {
  _$AppStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AppStatesCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AppStates.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int themeCode) changeTheme,
    required TResult Function() switchTheme,
    required TResult Function() themeSwitched,
    required TResult Function(int languageCode) changeLanguage,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int themeCode)? changeTheme,
    TResult? Function()? switchTheme,
    TResult? Function()? themeSwitched,
    TResult? Function(int languageCode)? changeLanguage,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int themeCode)? changeTheme,
    TResult Function()? switchTheme,
    TResult Function()? themeSwitched,
    TResult Function(int languageCode)? changeLanguage,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_SwitchTheme value) switchTheme,
    required TResult Function(_ThemeSwitched value) themeSwitched,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ChangeTheme value)? changeTheme,
    TResult? Function(_SwitchTheme value)? switchTheme,
    TResult? Function(_ThemeSwitched value)? themeSwitched,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_SwitchTheme value)? switchTheme,
    TResult Function(_ThemeSwitched value)? themeSwitched,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppStates {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AppStatesCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AppStates.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int themeCode) changeTheme,
    required TResult Function() switchTheme,
    required TResult Function() themeSwitched,
    required TResult Function(int languageCode) changeLanguage,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int themeCode)? changeTheme,
    TResult? Function()? switchTheme,
    TResult? Function()? themeSwitched,
    TResult? Function(int languageCode)? changeLanguage,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int themeCode)? changeTheme,
    TResult Function()? switchTheme,
    TResult Function()? themeSwitched,
    TResult Function(int languageCode)? changeLanguage,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_SwitchTheme value) switchTheme,
    required TResult Function(_ThemeSwitched value) themeSwitched,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ChangeTheme value)? changeTheme,
    TResult? Function(_SwitchTheme value)? switchTheme,
    TResult? Function(_ThemeSwitched value)? themeSwitched,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_SwitchTheme value)? switchTheme,
    TResult Function(_ThemeSwitched value)? themeSwitched,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AppStates {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ChangeThemeImplCopyWith<$Res> {
  factory _$$ChangeThemeImplCopyWith(
          _$ChangeThemeImpl value, $Res Function(_$ChangeThemeImpl) then) =
      __$$ChangeThemeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int themeCode});
}

/// @nodoc
class __$$ChangeThemeImplCopyWithImpl<$Res>
    extends _$AppStatesCopyWithImpl<$Res, _$ChangeThemeImpl>
    implements _$$ChangeThemeImplCopyWith<$Res> {
  __$$ChangeThemeImplCopyWithImpl(
      _$ChangeThemeImpl _value, $Res Function(_$ChangeThemeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeCode = null,
  }) {
    return _then(_$ChangeThemeImpl(
      null == themeCode
          ? _value.themeCode
          : themeCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeThemeImpl implements _ChangeTheme {
  const _$ChangeThemeImpl(this.themeCode);

  @override
  final int themeCode;

  @override
  String toString() {
    return 'AppStates.changeTheme(themeCode: $themeCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeThemeImpl &&
            (identical(other.themeCode, themeCode) ||
                other.themeCode == themeCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeThemeImplCopyWith<_$ChangeThemeImpl> get copyWith =>
      __$$ChangeThemeImplCopyWithImpl<_$ChangeThemeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int themeCode) changeTheme,
    required TResult Function() switchTheme,
    required TResult Function() themeSwitched,
    required TResult Function(int languageCode) changeLanguage,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return changeTheme(themeCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int themeCode)? changeTheme,
    TResult? Function()? switchTheme,
    TResult? Function()? themeSwitched,
    TResult? Function(int languageCode)? changeLanguage,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return changeTheme?.call(themeCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int themeCode)? changeTheme,
    TResult Function()? switchTheme,
    TResult Function()? themeSwitched,
    TResult Function(int languageCode)? changeLanguage,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(themeCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_SwitchTheme value) switchTheme,
    required TResult Function(_ThemeSwitched value) themeSwitched,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return changeTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ChangeTheme value)? changeTheme,
    TResult? Function(_SwitchTheme value)? switchTheme,
    TResult? Function(_ThemeSwitched value)? themeSwitched,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return changeTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_SwitchTheme value)? switchTheme,
    TResult Function(_ThemeSwitched value)? themeSwitched,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (changeTheme != null) {
      return changeTheme(this);
    }
    return orElse();
  }
}

abstract class _ChangeTheme implements AppStates {
  const factory _ChangeTheme(final int themeCode) = _$ChangeThemeImpl;

  int get themeCode;
  @JsonKey(ignore: true)
  _$$ChangeThemeImplCopyWith<_$ChangeThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwitchThemeImplCopyWith<$Res> {
  factory _$$SwitchThemeImplCopyWith(
          _$SwitchThemeImpl value, $Res Function(_$SwitchThemeImpl) then) =
      __$$SwitchThemeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchThemeImplCopyWithImpl<$Res>
    extends _$AppStatesCopyWithImpl<$Res, _$SwitchThemeImpl>
    implements _$$SwitchThemeImplCopyWith<$Res> {
  __$$SwitchThemeImplCopyWithImpl(
      _$SwitchThemeImpl _value, $Res Function(_$SwitchThemeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchThemeImpl implements _SwitchTheme {
  const _$SwitchThemeImpl();

  @override
  String toString() {
    return 'AppStates.switchTheme()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchThemeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int themeCode) changeTheme,
    required TResult Function() switchTheme,
    required TResult Function() themeSwitched,
    required TResult Function(int languageCode) changeLanguage,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return switchTheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int themeCode)? changeTheme,
    TResult? Function()? switchTheme,
    TResult? Function()? themeSwitched,
    TResult? Function(int languageCode)? changeLanguage,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return switchTheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int themeCode)? changeTheme,
    TResult Function()? switchTheme,
    TResult Function()? themeSwitched,
    TResult Function(int languageCode)? changeLanguage,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (switchTheme != null) {
      return switchTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_SwitchTheme value) switchTheme,
    required TResult Function(_ThemeSwitched value) themeSwitched,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return switchTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ChangeTheme value)? changeTheme,
    TResult? Function(_SwitchTheme value)? switchTheme,
    TResult? Function(_ThemeSwitched value)? themeSwitched,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return switchTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_SwitchTheme value)? switchTheme,
    TResult Function(_ThemeSwitched value)? themeSwitched,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (switchTheme != null) {
      return switchTheme(this);
    }
    return orElse();
  }
}

abstract class _SwitchTheme implements AppStates {
  const factory _SwitchTheme() = _$SwitchThemeImpl;
}

/// @nodoc
abstract class _$$ThemeSwitchedImplCopyWith<$Res> {
  factory _$$ThemeSwitchedImplCopyWith(
          _$ThemeSwitchedImpl value, $Res Function(_$ThemeSwitchedImpl) then) =
      __$$ThemeSwitchedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ThemeSwitchedImplCopyWithImpl<$Res>
    extends _$AppStatesCopyWithImpl<$Res, _$ThemeSwitchedImpl>
    implements _$$ThemeSwitchedImplCopyWith<$Res> {
  __$$ThemeSwitchedImplCopyWithImpl(
      _$ThemeSwitchedImpl _value, $Res Function(_$ThemeSwitchedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ThemeSwitchedImpl implements _ThemeSwitched {
  const _$ThemeSwitchedImpl();

  @override
  String toString() {
    return 'AppStates.themeSwitched()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ThemeSwitchedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int themeCode) changeTheme,
    required TResult Function() switchTheme,
    required TResult Function() themeSwitched,
    required TResult Function(int languageCode) changeLanguage,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return themeSwitched();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int themeCode)? changeTheme,
    TResult? Function()? switchTheme,
    TResult? Function()? themeSwitched,
    TResult? Function(int languageCode)? changeLanguage,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return themeSwitched?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int themeCode)? changeTheme,
    TResult Function()? switchTheme,
    TResult Function()? themeSwitched,
    TResult Function(int languageCode)? changeLanguage,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (themeSwitched != null) {
      return themeSwitched();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_SwitchTheme value) switchTheme,
    required TResult Function(_ThemeSwitched value) themeSwitched,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return themeSwitched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ChangeTheme value)? changeTheme,
    TResult? Function(_SwitchTheme value)? switchTheme,
    TResult? Function(_ThemeSwitched value)? themeSwitched,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return themeSwitched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_SwitchTheme value)? switchTheme,
    TResult Function(_ThemeSwitched value)? themeSwitched,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (themeSwitched != null) {
      return themeSwitched(this);
    }
    return orElse();
  }
}

abstract class _ThemeSwitched implements AppStates {
  const factory _ThemeSwitched() = _$ThemeSwitchedImpl;
}

/// @nodoc
abstract class _$$ChangeLanguageImplCopyWith<$Res> {
  factory _$$ChangeLanguageImplCopyWith(_$ChangeLanguageImpl value,
          $Res Function(_$ChangeLanguageImpl) then) =
      __$$ChangeLanguageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int languageCode});
}

/// @nodoc
class __$$ChangeLanguageImplCopyWithImpl<$Res>
    extends _$AppStatesCopyWithImpl<$Res, _$ChangeLanguageImpl>
    implements _$$ChangeLanguageImplCopyWith<$Res> {
  __$$ChangeLanguageImplCopyWithImpl(
      _$ChangeLanguageImpl _value, $Res Function(_$ChangeLanguageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_$ChangeLanguageImpl(
      null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeLanguageImpl implements _ChangeLanguage {
  const _$ChangeLanguageImpl(this.languageCode);

  @override
  final int languageCode;

  @override
  String toString() {
    return 'AppStates.changeLanguage(languageCode: $languageCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLanguageImpl &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeLanguageImplCopyWith<_$ChangeLanguageImpl> get copyWith =>
      __$$ChangeLanguageImplCopyWithImpl<_$ChangeLanguageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int themeCode) changeTheme,
    required TResult Function() switchTheme,
    required TResult Function() themeSwitched,
    required TResult Function(int languageCode) changeLanguage,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return changeLanguage(languageCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int themeCode)? changeTheme,
    TResult? Function()? switchTheme,
    TResult? Function()? themeSwitched,
    TResult? Function(int languageCode)? changeLanguage,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return changeLanguage?.call(languageCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int themeCode)? changeTheme,
    TResult Function()? switchTheme,
    TResult Function()? themeSwitched,
    TResult Function(int languageCode)? changeLanguage,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(languageCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_SwitchTheme value) switchTheme,
    required TResult Function(_ThemeSwitched value) themeSwitched,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return changeLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ChangeTheme value)? changeTheme,
    TResult? Function(_SwitchTheme value)? switchTheme,
    TResult? Function(_ThemeSwitched value)? themeSwitched,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return changeLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_SwitchTheme value)? switchTheme,
    TResult Function(_ThemeSwitched value)? themeSwitched,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(this);
    }
    return orElse();
  }
}

abstract class _ChangeLanguage implements AppStates {
  const factory _ChangeLanguage(final int languageCode) = _$ChangeLanguageImpl;

  int get languageCode;
  @JsonKey(ignore: true)
  _$$ChangeLanguageImplCopyWith<_$ChangeLanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AppStatesCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl();

  @override
  String toString() {
    return 'AppStates.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int themeCode) changeTheme,
    required TResult Function() switchTheme,
    required TResult Function() themeSwitched,
    required TResult Function(int languageCode) changeLanguage,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int themeCode)? changeTheme,
    TResult? Function()? switchTheme,
    TResult? Function()? themeSwitched,
    TResult? Function(int languageCode)? changeLanguage,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int themeCode)? changeTheme,
    TResult Function()? switchTheme,
    TResult Function()? themeSwitched,
    TResult Function(int languageCode)? changeLanguage,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_SwitchTheme value) switchTheme,
    required TResult Function(_ThemeSwitched value) themeSwitched,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ChangeTheme value)? changeTheme,
    TResult? Function(_SwitchTheme value)? switchTheme,
    TResult? Function(_ThemeSwitched value)? themeSwitched,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_SwitchTheme value)? switchTheme,
    TResult Function(_ThemeSwitched value)? themeSwitched,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AppStates {
  const factory _Loaded() = _$LoadedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AppStatesCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppStates.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int themeCode) changeTheme,
    required TResult Function() switchTheme,
    required TResult Function() themeSwitched,
    required TResult Function(int languageCode) changeLanguage,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int themeCode)? changeTheme,
    TResult? Function()? switchTheme,
    TResult? Function()? themeSwitched,
    TResult? Function(int languageCode)? changeLanguage,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int themeCode)? changeTheme,
    TResult Function()? switchTheme,
    TResult Function()? themeSwitched,
    TResult Function(int languageCode)? changeLanguage,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ChangeTheme value) changeTheme,
    required TResult Function(_SwitchTheme value) switchTheme,
    required TResult Function(_ThemeSwitched value) themeSwitched,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ChangeTheme value)? changeTheme,
    TResult? Function(_SwitchTheme value)? switchTheme,
    TResult? Function(_ThemeSwitched value)? themeSwitched,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ChangeTheme value)? changeTheme,
    TResult Function(_SwitchTheme value)? switchTheme,
    TResult Function(_ThemeSwitched value)? themeSwitched,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AppStates {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
