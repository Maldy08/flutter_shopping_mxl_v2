import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_bloc_event.dart';
part 'shared_preferences_bloc_state.dart';

class SharedPreferencesBlocBloc
    extends Bloc<SharedPreferencesBlocEvent, SharedPreferencesBlocState> {
  SharedPreferencesBlocBloc() : super(const SharedPreferencesBlocState()) {
    on<SharedPreferencesBlocEvent>((event, emit) {});
  }

  Future<void> _loadSharedPreferences(SharedPreferencesInitialize event,
      Emitter<SharedPreferencesBlocState> emit) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
  }
}
