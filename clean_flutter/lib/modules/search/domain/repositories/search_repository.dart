import 'package:clean_flutter/modules/search/domain/entities/search.dart';

abstract class SearchRepository {
  Future<List<Search>> search(String title);
}
