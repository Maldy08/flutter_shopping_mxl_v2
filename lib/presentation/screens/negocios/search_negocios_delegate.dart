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
        return ListTile(
          title: Text(suggestionList[index].nombreEmpresa),
          onTap: () {
            query = suggestionList[index].id;
            // Show the search results based on the selected suggestion.
          },
        );
      },
    );
  }
}
