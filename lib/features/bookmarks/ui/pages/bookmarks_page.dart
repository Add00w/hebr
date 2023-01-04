import 'package:flutter/material.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({Key? key}) : super(key: key);
  static const _savedArticles = [
    'What makes developers different?',
    'Humanity matters, but how to be human?',
    'Five things every flutter developer should know.'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your library',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Text('Saved articles'),
            Expanded(
              child: ListView.builder(
                itemCount: _savedArticles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_savedArticles[index]),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
