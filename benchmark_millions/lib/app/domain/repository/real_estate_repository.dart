import 'package:benchmark_millions/app/domain/model/real_estate.dart';

abstract class IRealEstateRepository {
  Future<List<RealEstate>> getRealEstates();
}
