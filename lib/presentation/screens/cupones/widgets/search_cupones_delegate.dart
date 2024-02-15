import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/cupones.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/cupones/cupones_screen.dart';

class SearchCuponesDelegate extends SearchDelegate {
  final List<Cupones> searchList;

  SearchCuponesDelegate(this.searchList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  String? get searchFieldLabel => 'Buscar cupones';
  @override
  TextStyle? get searchFieldStyle => const TextStyle(fontSize: 16);

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
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
    final List<Cupones> suggestionList = query.isEmpty
        ? []
        : searchList
            .where((item) =>
                item.descripcion.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return _PromocionesItem(
          cupones: suggestionList[index],
          onNegocioSelected: (context, negocio) {
            close(context, negocio);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CuponesScreen(id: negocio.id)));
            //context.push('/home/0/negocio/${negocio.id}');
          },
        );
      },
    );
  }
}

class _PromocionesItem extends StatelessWidget {
  final Cupones cupones;
  final Function onNegocioSelected;

  const _PromocionesItem(
      {required this.cupones, required this.onNegocioSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onNegocioSelected(context, cupones);
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
                  cupones.photoUrl,
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
                  Text(cupones.descripcion),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
