import 'package:day1/logic/cubit/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(
            SettingsState(appNotifications: false, emailNotifications: false));
  void onAppNotifications(bool newValue) =>
      emit(state.copyWith(appNotifications: newValue));
  void onEmailNotifications(bool newValue) =>
      emit(state.copyWith(emailNotifications: newValue));
}
