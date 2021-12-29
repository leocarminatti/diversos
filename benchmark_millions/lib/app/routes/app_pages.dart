import 'package:benchmark_millions/app/binding/real_estate_binding.dart';
import 'package:benchmark_millions/app/presenter/home/pages/home_page.dart';
import 'package:benchmark_millions/app/presenter/real_estate/pages/real_estate_page.dart';
import 'package:benchmark_millions/app/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.REAL_ESTATE,
      page: () => const RealEstatePage(),
      binding: RealEstateBinding(),
    ),
  ];
}
