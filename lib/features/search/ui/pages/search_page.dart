import 'package:flutter/material.dart';

class SearchPage extends SearchDelegate<String> {
  String? _result;
  static const _articles = [
    'What makes developers different?',
    'How to be successful everywhere without giving shit.',
    'Humanity matters, but how to be human?',
    'Five things every flutter developer should know'
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return _buildActions(context);
  }

  @override
  Widget buildLeading(BuildContext context) {
    return _buildLeading(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    final resutlts = _articles.where((article) {
      return article.toLowerCase().contains(query);
    });
    return ListView.builder(
      itemCount: resutlts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(resutlts.elementAt(index)),
          onTap: () {
            _result = resutlts.elementAt(index);
            close(context, _result ?? query);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _articles.where(
      (element) {
        return element.toLowerCase().contains(query);
      },
    );
    return Scrollbar(
      thickness: 10,
      radius: const Radius.circular(5),
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const Divider(
            thickness: 1.5,
            endIndent: 10,
            indent: 10,
          );
        },
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  suggestions.elementAt(index),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.history),
              ),
            ),
            onTap: () {
              query = suggestions.elementAt(index);
              close(context, _result ?? query);
            },
          );
        },
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, _result ?? query);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, _result ?? query);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }
}
