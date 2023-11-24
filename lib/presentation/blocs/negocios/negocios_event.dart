part of 'negocios_bloc.dart';

class NegociosEvent {
  const NegociosEvent();
}

class NegociosFetched extends NegociosEvent {
  //final List<Negocios> negocios;
  //const NegociosFetched(this.negocios);
  const NegociosFetched();
}

class NegocioFetchedById extends NegociosEvent {
  final String id;

  NegocioFetchedById(this.id);
}
