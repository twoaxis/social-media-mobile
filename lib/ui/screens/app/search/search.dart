import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

List<String> names = <String>[
  'John Doe',
  'Mary Smith',
  'Mohamed Ali',
  'Elon Musk',
  'Steve Jobs',
  'Bill Gates',
  'Steve Wozniak',
  'Mark Zuckerberg',
  'Salah',
  'Cristiano Ronaldo',
  'Lionel Messi',
];
List<String> filters = <String>[];

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showSearch(
          context: context,
          delegate: _SearchDelegate(),
          query: '',
        );
      },
      iconSize: 25,
      icon: const Icon(FluentIcons.search_16_filled),
    );
  }
}

// implement search delegate

class _SearchDelegate extends SearchDelegate<String> {
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
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    filters = names
        .where(
          (element) => element.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    return ListView.builder(
      itemCount: filters.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filters[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = (names
                .where(
                  (element) => element.toLowerCase().contains(
                        query.toLowerCase(),
                      ),
                )
                .toList() +
            names)
        .toSet()
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            query = suggestions[index];

            showResults(context);
          },
          child: ListTile(
            title: Text(suggestions[index]),
          ),
        );
      },
    );
  }
}
