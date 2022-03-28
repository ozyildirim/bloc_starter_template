part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  bool? appNotifications;
  bool? emailNotifications;

  SettingsState({
    required this.appNotifications,
    required this.emailNotifications,
  });

  @override
  List<Object?> get props => [appNotifications, emailNotifications];

  SettingsState copyWith({
    bool? appNotifications,
    bool? emailNotifications,
  }) {
    return SettingsState(
      appNotifications: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appNotifications': appNotifications,
      'emailNotifications': emailNotifications,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      appNotifications: map['appNotifications'],
      emailNotifications: map['emailNotifications'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsState.fromJson(String source) =>
      SettingsState.fromMap(json.decode(source));

  @override
  String toString() =>
      'SettingsState(appNotifications: $appNotifications, emailNotifications: $emailNotifications)';
}
