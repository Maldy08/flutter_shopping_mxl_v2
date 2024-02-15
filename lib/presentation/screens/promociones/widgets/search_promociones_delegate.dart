import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens.dart';

class SearchPromocionesDelegate extends SearchDelegate {
  final List<Promociones> searchList;
  final List<Negocios> negocios;

  SearchPromocionesDelegate(this.searchList, this.negocios);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  String? get searchFieldLabel => 'Buscar ofertas';
  @override
  TextStyle? get searchFieldStyle => const TextStyle(fontSize: 16);

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, []),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  Widget buildResultsAndSuggestions() {
    final List<Promociones> suggestionList = query.isEmpty
        ? []
        : searchList
            .where((item) =>
                item.descripcion.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return _PromocionItem(
          promocion: suggestionList[index],
          negocio: negocios.firstWhere(
              (element) => element.id == suggestionList[index].idNegocio),
          onNegocioSelected: (context, negocio) {
            close(context, negocio);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PromocionesScreen(id: negocio.id)));
            //context.push('/home/0/negocio/${negocio.id}');
          },
        );
      },
    );
  }
}

class _PromocionItem extends StatelessWidget {
  final Promociones promocion;
  final Negocios negocio;
  final Function onNegocioSelected;

  const _PromocionItem(
      {required this.promocion,
      required this.onNegocioSelected,
      required this.negocio});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onNegocioSelected(context, promocion);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  negocio.photoUrl,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(promocion.descripcion),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
