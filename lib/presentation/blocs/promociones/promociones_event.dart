part of 'promociones_bloc.dart';

class PromocionesEvent {
  const PromocionesEvent();
}

class PromocionesFetched extends PromocionesEvent {
  final String uid;
  PromocionesFetched(this.uid);
}

class PromocionesFetchedById extends PromocionesEvent {
  final String id;
  final String uid;

  PromocionesFetchedById(this.id, this.uid);
}
