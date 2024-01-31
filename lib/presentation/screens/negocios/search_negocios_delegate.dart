import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';

class SearchNegociosDelegate extends SearchDelegate {
  final List<Negocios> searchList;

  SearchNegociosDelegate(this.searchList);

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
  String? get searchFieldLabel => 'Buscar afiliado';
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
    final List<Negocios> searchResults = searchList
        .where((item) => item.nombreEmpresa.contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].nombreEmpresa),
          onTap: () {
            // Handle the selected search result.
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Negocios> suggestionList = query.isEmpty
        ? []
        : searchList
            .where((item) =>
                item.nombreEmpresa.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return _NegocioItem(
          negocio: suggestionList[index],
          onNegocioSelected: (context, negocio) {
            // close(context, negocio);
            //context.push('/home/0/negocio/${negocio.id}');
          },
        );
      },
    );
  }
}

class _NegocioItem extends StatelessWidget {
  final Negocios negocio;
  final Function onNegocioSelected;

  const _NegocioItem({required this.negocio, required this.onNegocioSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onNegocioSelected(context, negocio);
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
                  Text(negocio.nombreEmpresa),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// ListTile(
//           title: Text(suggestionList[index].nombreEmpresa),
//           onTap: () {
//             query = suggestionList[index].id;
//             // Show the search results based on the selected suggestion.
//           },
//         );