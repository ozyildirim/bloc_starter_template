import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(
            SettingsState(appNotifications: false, emailNotifications: false));

  void toggleAppNotification(bool newValue) {
    emit(state.copyWith(appNotifications: newValue));
  }

  void toggleEmailNotification(bool newValue) {
    emit(state.copyWith(emailNotifications: newValue));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }
}
