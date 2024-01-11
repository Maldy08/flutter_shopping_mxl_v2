part of 'shared_preferences_bloc_bloc.dart';

class SharedPreferencesBlocEvent {
  const SharedPreferencesBlocEvent();
}

class SharedPreferencesInitialize extends SharedPreferencesBlocEvent {
  const SharedPreferencesInitialize();
}

class SharedPreferencesSave extends SharedPreferencesBlocEvent {
  const SharedPreferencesSave();
}
