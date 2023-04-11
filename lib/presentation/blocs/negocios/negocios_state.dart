part of 'negocios_bloc.dart';

abstract class NegociosState extends Equatable {
  const NegociosState();
  
  @override
  List<Object> get props => [];
}

class NegociosInitial extends NegociosState {}
