import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './search_page.dart';
import '../../bloc/search_cubit.dart';

class InitialSearchPage extends StatelessWidget {
  const InitialSearchPage({Key? key}) : super(key: key);
  static const _searchHistory = [
    'What makes developers different?',
    'How to be successful everywhere without giving shit.',
    'Humanity matters, but how to be human?',
    'Five things every flutter developer should know'
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onTap: () async {
                    final result = await showSearch(
                          context: context,
                          delegate: SearchPage(),
                        ) ??
                        '';
                    BlocProvider.of<SearchCubit>(context)
                        .selectedResult(result);
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                (state as SearchResult).result.isNotEmpty
                    ? Text(state.result)
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _searchHistory.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_searchHistory[index]),
                              onTap: () {},
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
