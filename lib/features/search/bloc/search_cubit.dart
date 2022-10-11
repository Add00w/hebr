import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchResult());
  void selectedResult(String result) {
    emit(SearchResult(result: result));
  }
}
