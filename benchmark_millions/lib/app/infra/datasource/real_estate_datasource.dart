import 'package:benchmark_millions/app/domain/model/real_estate.dart';

abstract class RealEstateDataSource {
  Future<List<RealEstate>> getRealEstates();
}
