part of 'cupones_bloc.dart';

class CuponesEvent {
  const CuponesEvent();
}

class CuponesFetched extends CuponesEvent {
  final String uid;
  CuponesFetched(this.uid);
}

class CuponesFetchedById extends CuponesEvent {
  final String id;
  final String uid;

  CuponesFetchedById(this.id, this.uid);
}
