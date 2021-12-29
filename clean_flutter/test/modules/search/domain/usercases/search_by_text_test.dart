import 'package:clean_flutter/modules/search/domain/entities/search.dart';
import 'package:clean_flutter/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_flutter/modules/search/domain/usercases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usercase = SearchByTextImpl(repository);

  test('deve retornar uma lista de Search', () async {
    when(repository.search(any)).thenAnswer((_) async => []);

    final result = await usercase.get('title');
    expect(result, isA<List<Search>>());
  });

  test('deve retornar uma vazio caso o texto seja nulo', () async {
    when(repository.search(any)).thenAnswer((realInvocation) async => []);

    final result = await usercase.get(null);

    expect(result.isEmpty, true);
  });

  test('deve retornar vazio caso o texto seja vazio', () async {
    when(repository.search(any)).thenAnswer((realInvocation) async => []);

    final result = await usercase.get('');

    expect(result.isEmpty, true);
  });
}
