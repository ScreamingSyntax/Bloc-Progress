import 'package:day1/logic/cubit/settings_cubit.dart';
import 'package:day1/logic/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          final settingsSnackBar = SnackBar(
              content: Text(
                  "App Notification : ${context.read<SettingsCubit>().state.appNotifications}     Email Notification : ${context.read<SettingsCubit>().state.emailNotifications}"));
          ScaffoldMessenger.of(context).showSnackBar(settingsSnackBar);
        },
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  return SwitchListTile(
                    title: const Text("App Notifications"),
                    value: state.appNotifications,
                    onChanged: (changedValue) {
                      BlocProvider.of<SettingsCubit>(context)
                          .onAppNotifications(changedValue);
                    },
                  );
                },
              ),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  return SwitchListTile(
                    title: const Text("Email Notifications"),
                    value:
                        context.read<SettingsCubit>().state.emailNotifications,
                    onChanged: (value) {
                      context.read<SettingsCubit>().onEmailNotifications(value);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
