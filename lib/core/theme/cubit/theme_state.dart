part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  ThemeState({this.isDarkModeActive = false});

  final bool isDarkModeActive;

  ThemeState copyWith({
    ThemeData? lightThemeData,
    ThemeData? darkThemeData,
    bool? isDarkModeActive,
  }) {
    return ThemeState(
      isDarkModeActive: isDarkModeActive ?? this.isDarkModeActive,
    );
  }

  @override
  List<Object?> get props => [isDarkModeActive];
}
