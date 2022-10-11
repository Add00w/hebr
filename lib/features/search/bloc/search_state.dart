part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchResult extends SearchState {
  final String result;

  SearchResult({this.result = ''});
}
