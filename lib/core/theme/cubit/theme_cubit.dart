import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(isDarkModeActive: false),
        );

  void toggleThemeMode(bool newValue) {
    emit(state.copyWith(
      isDarkModeActive:
          state.isDarkModeActive != newValue ? newValue : !newValue,
    ));
  }
}
