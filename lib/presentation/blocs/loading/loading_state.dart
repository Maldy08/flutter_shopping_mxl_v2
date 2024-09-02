part of 'loading_bloc.dart';

enum LoadingStatus {
  loading,
  completed,
  error,
  initial,
}

class LoadingState extends Equatable {
  final LoadingStatus status;

  const LoadingState({this.status = LoadingStatus.loading});

  LoadingState copyWith({
    LoadingStatus? status,
  }) =>
      LoadingState(
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [status];
}

final class LoadingInitial extends LoadingState {}
