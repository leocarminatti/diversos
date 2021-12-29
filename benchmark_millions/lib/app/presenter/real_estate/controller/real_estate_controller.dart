import 'package:benchmark_millions/app/domain/repository/real_estate_repository.dart';
import 'package:benchmark_millions/app/dsc/widgets/loader.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RealEstateController extends GetxController {
  final IRealEstateRepository repository;

  RealEstateController(this.repository);

  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  @override
  onReady() {
    final loadingOverlay = LoadingOverlay.of(Get.context!);

    ever(loading, (bool value) => value ? loadingOverlay.show() : loadingOverlay.hide());

    load();

    super.onReady();
  }

  load() async {
    try {
      loading.value = true;

      final result = await repository.getRealEstates();

      final fiis = result
          .where((e) =>
              (e.dividendYieldAccumulated > 8 && e.dividendYieldAccumulated < 14) &&
              (e.pvp < 1.05 && e.pvp > 0.85) &&
              //(e.dailyLiquidity > 4000) &&
              (e.marketValue > 500000000))
          .toList();

      var lowestPricePVP = fiis..sort((a, b) => a.pvp.compareTo(b.pvp));
      lowestPricePVP = lowestPricePVP.take(10).toList();

      var biggestPriceDY = fiis
        ..sort((a, b) => b.dividendYieldAccumulated.compareTo(a.dividendYieldAccumulated));
      biggestPriceDY = biggestPriceDY.take(10).toList();

      var biggestPriceVM = fiis..sort((a, b) => b.marketValue.compareTo(a.marketValue));
      biggestPriceVM = biggestPriceVM.take(10).toList();

      var biggestPriceLiquidity = fiis
        ..sort((a, b) => b.dailyLiquidity.compareTo(a.dailyLiquidity));
      biggestPriceLiquidity = biggestPriceLiquidity.take(10).toList();

      var tops = [];

      for (var value in fiis) {
        bool first = false;
        bool second = false;
        bool third = false;
        //bool fourth = false;

        first = lowestPricePVP.contains(value);
        second = biggestPriceDY.contains(value);
        third = biggestPriceVM.contains(value);
        //fourth = biggestPriceLiquidity.contains(value);

        if (first && second && third) {
          tops.add(value);
        }
      }

      loading.value = false;
    } catch (e) {
      loading.value = false;
    }
  }
}
