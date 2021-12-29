import 'package:clean_flutter/modules/search/domain/entities/search.dart';
import 'package:clean_flutter/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  Future<List<Search>> get(String title);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<List<Search>> get(String title) async {
    if (title == null || title.isEmpty) {
      return [];
    }

    return repository.search(title);
  }
}
