import 'package:benchmark_millions/app/domain/repository/real_estate_repository.dart';
import 'package:benchmark_millions/app/external/api/real_estata_api.dart';
import 'package:benchmark_millions/app/infra/datasource/real_estate_datasource.dart';
import 'package:benchmark_millions/app/infra/repository/real_estate_repository_impl.dart';
import 'package:benchmark_millions/app/presenter/real_estate/controller/real_estate_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

class RealEstateBinding implements Bindings {
  @override
  void dependencies() {
    RealEstateDataSource api = RealEstateApi(http.Client());
    Get.put(api);
    IRealEstateRepository repository = RealEstateRepository(api);
    Get.put(repository);
    Get.put(RealEstateController(repository));
  }
}
