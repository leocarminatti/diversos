import 'package:benchmark_millions/app/domain/model/real_estate.dart';
import 'package:benchmark_millions/app/domain/repository/real_estate_repository.dart';
import 'package:benchmark_millions/app/infra/datasource/real_estate_datasource.dart';

class RealEstateRepository implements IRealEstateRepository {
  final RealEstateDataSource dataSource;

  RealEstateRepository(this.dataSource);

  @override
  Future<List<RealEstate>> getRealEstates() async {
    try {
      final list = await dataSource.getRealEstates();

      if (list.isEmpty) {
        return [];
      }

      return list;
    } catch (e) {
      //return Left<Failure, List<Result>>(ErrorSearch());
      return [];
    }
  }
}
