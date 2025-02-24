part of 'settings_cubit.dart';


@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class SettingsLoaded extends SettingsState {
  final SettingsPrivacyPolicyResponse privacyPolicy;

  SettingsLoaded(this.privacyPolicy);
}

final class SettingsError extends SettingsState {
  final String message;

  SettingsError(this.message);
}

final class SettingsNetworkError extends SettingsState {
  final String message;

  SettingsNetworkError(this.message);
}
