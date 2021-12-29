import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(http.Client());
    //Get.put(Network(Config().baseUrl));
  }
}
