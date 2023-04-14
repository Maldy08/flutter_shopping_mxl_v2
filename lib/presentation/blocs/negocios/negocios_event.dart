part of 'negocios_bloc.dart';

class NegociosEvent {
  const NegociosEvent();
}

class NegociosFetched extends NegociosEvent {
  //final List<Negocios> negocios;
  //const NegociosFetched(this.negocios);
}

class LoadNegocio extends NegociosEvent {
  final String id;

  LoadNegocio(this.id);
}
