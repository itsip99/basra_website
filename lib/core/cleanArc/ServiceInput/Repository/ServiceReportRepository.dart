import 'package:stsj/core/cleanArc/ServiceInput/Data/model/Service.dart';
import 'package:stsj/core/cleanArc/ServiceInput/Domain/DTO/DTOlistReport.dart';
import 'package:stsj/core/cleanArc/ServiceInput/Domain/interface/serviceInterface.dart';
import 'package:stsj/core/service/API/Exception.dart';
import 'package:stsj/core/service/API/network/network_api_service.dart';

class ServiceRepository extends ServiceInterface {
  final _api = NetworkAPIService();

  @override
  Future<List<Map<String, dynamic>>> fetchServiceReport(
      ServiceReportDTO serviceReportDTO) async {
    print(serviceReportDTO);
    Map body = {
      "Territori": serviceReportDTO.territori,
      "Tahun": serviceReportDTO.tahun,
      "Bulan": serviceReportDTO.bulan
    };

    try {
      dynamic response = await _api.postAPI(body,
          'https://wsip.yamaha-jatim.co.id:2448/Service/Dashboard/Parameter');
      // print(response);

      if (response['code'] == '100' || response['msg'] == 'Sukses') {
        List<ServiceReport> listReport = response['data']
            .map<ServiceReport>((item) => ServiceReport.fromJson(item))
            .toList();

        List<Map<String, dynamic>> mapData = [];

        mapData = listReport.map((item) {
          return {
            'KODE DPACK': item.dPackID.toString(),
            'NAMA DEALER': item.cName.toString(),
            'KOTA': item.cDistrict.toString(),
            'MEKANIK': item.mekanik.toString(),
            'KSG1': item.ksG1.toString(),
            'KSG2': item.ksG2.toString(),
            'KSG3': item.ksG3.toString(),
            'KSG4': item.ksG4.toString(),
            'Unit Entry': item.unitEntry.toString(),
            'LABOUR': item.labour.toString(),
            'WorkshopPart': item.workshopPart.toString(),
            'WorkshopOli': item.workshopOli.toString(),
            'RetailPart': item.retailPart.toString(),
            'RetailOli': item.retailOli.toString(),
          };
        }).toList();

        return mapData;
      } else {
        if (response['data'] != null && response['data'].isNotEmpty) {
          throw APIException(
              '${response['code']}, ${response['msg']}. ${response['data'][0]['resultMessage']}');
        }

        throw APIException('code: ${response['code']}, ${response['msg']}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> postReport(List<Map<String, dynamic>> serviceReport) async {
    Map body = {"Mode": "1", "Detail": serviceReport};

    try {
      dynamic response = await _api.postAPI(body,
          'https://wsip.yamaha-jatim.co.id:2448/Service/Dashboard/ModifyDashoardServiceParameter');

      if (response['code'] == '100' || response['msg'] == 'sukses') {
        return true;
      } else {
        if (response['data'] != null && response['data'].isNotEmpty) {
          throw APIException(
              '${response['code']}, ${response['msg']}. ${response['data'][0]['resultMessage']}');
        }

        throw APIException('code: ${response['code']}, ${response['msg']}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
