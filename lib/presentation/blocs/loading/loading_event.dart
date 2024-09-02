part of 'loading_bloc.dart';

class LoadingEvent {
  const LoadingEvent();
}

class SetLoading extends LoadingEvent {
  //final LoadingStatus status;
  const SetLoading();
}

class SetCompleted extends LoadingEvent {
  const SetCompleted();
}
