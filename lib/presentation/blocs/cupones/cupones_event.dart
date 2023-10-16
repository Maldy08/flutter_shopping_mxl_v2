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

  CuponesFetchedById(this.id);
}

class CuponesFetchAll extends CuponesEvent {
  const CuponesFetchAll();
}
