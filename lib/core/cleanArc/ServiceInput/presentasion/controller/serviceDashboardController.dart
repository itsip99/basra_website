import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ServiceDashboardController extends GetxController {
  RxString _selectedtahun = ''.obs;
  RxString _selectedBulan = ''.obs;
  RxString _selectedteritori = ''.obs;

  List<Map<String, dynamic>> data = [];

  get selectedtahun => _selectedtahun.value;
  get selectedBulan => _selectedBulan.value;
  get selectedteritori => _selectedteritori.value;

  String teritori(String teritori) {
    switch (teritori) {
      case 'IV':
        return '4';
      case 'VIII':
        return '8';
    }
    return '';
  }

  void setselectedtahun(String value) => _selectedtahun.value = value;
  void setselectedbulan(String value) => _selectedBulan.value = value;

  void setselecteteritori(String value) => _selectedteritori.value = value;

  RxList<Map<String, dynamic>> listTeritori = [
    {"name": "IV"},
    {"name": "VIII"},
  ].obs;

  List<Map<String, dynamic>> listTahun = [];

  List<Map<String, dynamic>> listBulan = [];
}
