part of 'shared_preferences_bloc_bloc.dart';

class SharedPreferencesBlocState extends Equatable {
  final bool isFirstTime;
  const SharedPreferencesBlocState({this.isFirstTime = true});

  SharedPreferencesBlocState copyWith({bool? isFirstTime}) =>
      SharedPreferencesBlocState(isFirstTime: isFirstTime ?? this.isFirstTime);
  @override
  List<Object> get props => [isFirstTime];
}
