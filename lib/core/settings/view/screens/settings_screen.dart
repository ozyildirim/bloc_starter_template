import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/cubit/theme_cubit.dart';
import '../../cubit/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Application Settings",
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) => Container(
                child: Column(
                  children: [
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Push Notifications",
                          style: Theme.of(context).textTheme.titleMedium),
                      onChanged: (newValue) => context
                          .read<SettingsCubit>()
                          .toggleAppNotification(newValue),
                      value: state.appNotifications!,
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("E-mail Notifications",
                          style: Theme.of(context).textTheme.titleMedium),
                      onChanged: (newValue) => context
                          .read<SettingsCubit>()
                          .toggleEmailNotification(newValue),
                      value: state.emailNotifications!,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Theme Settings",
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(color: Colors.grey),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) => Column(
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: state.isDarkModeActive!,
                    title: Text(
                      "Dark Mode",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onChanged: (newValue) =>
                        context.read<ThemeCubit>().toggleThemeMode(newValue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
