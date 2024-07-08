abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}
class ProfileLoadingState extends ProfileStates {}
class ProfileSuccessState extends ProfileStates {}
class ProfileErrorState extends ProfileStates {
  final String error;
  ProfileErrorState(this.error);
}

class ChangeThemeState extends ProfileStates {} 

class ResetPasswordLoadingState extends ProfileStates {}

class ResetPasswordSuccessState extends ProfileStates {}

class ResetPasswordErrorState extends ProfileStates {
  final String error;
  ResetPasswordErrorState(this.error);
}

class ShowOldPasswordState extends ProfileStates {}