import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_bloc_event.dart';
part 'shared_preferences_bloc_state.dart';

class SharedPreferencesBloc
    extends Bloc<SharedPreferencesBlocEvent, SharedPreferencesBlocState> {
  late SharedPreferences prefs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferencesBloc() : super(const SharedPreferencesBlocState()) {
    on<SharedPreferencesInitialize>(_loadSharedPreferences);
    on<SharedPreferencesSave>(_saveSharedPreferences);
  }

  Future<void> _loadSharedPreferences(SharedPreferencesInitialize event,
      Emitter<SharedPreferencesBlocState> emit) async {
    prefs = await _prefs;

    final use = prefs.getBool('isfirstRun');

    emit(state.copyWith(isFirstTime: use));
  }

  Future<void> _saveSharedPreferences(SharedPreferencesSave event,
      Emitter<SharedPreferencesBlocState> emit) async {
    prefs = await _prefs;

    prefs.setBool('isfirstRun', false);

    final use = prefs.getBool('isfirstRun');

    emit(state.copyWith(isFirstTime: false));
  }
}
