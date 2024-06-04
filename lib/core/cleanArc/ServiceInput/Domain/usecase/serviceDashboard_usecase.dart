import 'package:stsj/core/cleanArc/ServiceInput/Repository/ServiceReportRepository.dart';

class ServiceDashbarodUsecase {
  final _api = ServiceRepository();

  Future<bool> postService(List<Map<String, dynamic>> dtoServiceReport,
      {String tahun = '', String bulan = '', String userid = ''}) async {
    List<Map<String, dynamic>> serviceReportParsed =
        dtoServiceReport.map((report) {
      return {
        "DPackID": report["KODE DPACK"],
        "Tahun": tahun,
        "Bulan": bulan,
        "Mekanik": report["MEKANIK"],
        "KSG1": report["KSG1"],
        "KSG2": report["KSG2"],
        "KSG3": report["KSG3"],
        "KSG4": report["KSG4"],
        "UnitEntry": report["Unit Entry"],
        "Labour": report["LABOUR"],
        "WorkshopPart": report["WorkshopPart"],
        "WorkshopOli": report["WorkshopOli"],
        "RetailPart": report["RetailPart"],
        "RetailOli": report["RetailOli"],
        "UserID": userid,
      };
    }).toList();

    print(serviceReportParsed);

    // return true;

    try {
      bool isSuccess = await _api.postReport(serviceReportParsed);

      if (isSuccess) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
