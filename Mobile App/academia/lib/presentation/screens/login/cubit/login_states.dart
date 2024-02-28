part of 'login_cubit.dart';

@freezed
class LoginStates with _$LoginStates {
  const factory LoginStates.initial() = _Initial;
  const factory LoginStates.loading() = _Loading;
  const factory LoginStates.loaded() = _Loaded;
  const factory LoginStates.error(String message) = _Error;
}
