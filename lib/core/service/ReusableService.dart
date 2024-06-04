import 'package:intl/intl.dart' as intl;

class ServiceReusable {
  // untuk keperluan filter button
  static void resetFilter(
    Map<String, dynamic> selectedDates,
    int dayCount,
    int bulan,
    int tahun,
    void Function() onResetComplete,
  ) async {
    // Simulasikan operasi reset dengan penundaan selama 2 detik

    await Future.delayed(Duration(seconds: 1));

    // Reset tanggal
    selectedDates['hari'].clear();
    for (int i = 1; i <= dayCount; i++) {
      selectedDates['hari'].add(i);
    }

    selectedDates['bulan'] = bulan;
    selectedDates['tahun'] = tahun;

    // Panggil callback setelah reset selesai
    onResetComplete();
  }

  // untuk ubah tanggal ke bulan

  static String? cekbulan(int NamaBulan) {
    if (NamaBulan == 1) {
      return "JANUARI";
    } else if (NamaBulan == 2) {
      return "FEBRUARI";
    } else if (NamaBulan == 3) {
      return "MARET";
    } else if (NamaBulan == 4) {
      return "APRIL";
    } else if (NamaBulan == 5) {
      return "MEI";
    } else if (NamaBulan == 6) {
      return "JUNI";
    } else if (NamaBulan == 7) {
      return "JULI";
    } else if (NamaBulan == 8) {
      return "AGUSTUS";
    } else if (NamaBulan == 9) {
      return "SEPTEMBER";
    } else if (NamaBulan == 10) {
      return "OKTOBER";
    } else if (NamaBulan == 11) {
      return "NOVEMBER";
    } else if (NamaBulan == 12) {
      return "DESEMBER";
    }
  }

  //

  // bulan before

  static int bulanBeforeCheck(int bulan) {
    if (bulan == 1) {
      return 12; // Januari adalah bulan terakhir, kembalikan 12 (Desember)
    } else {
      return bulan - 1; // Untuk bulan lainnya, kembalikan bulan sebelumnya
    }
  }

  // 2bulan before

  static int bulan2BeforeCheck(int bulan) {
    if (bulan == 1) {
      return 11; // Januari adalah bulan terakhir, kembalikan 11 (November)
    } else if (bulan == 2) {
      return 12; // Februari adalah bulan terakhir, kembalikan 12 (Desember)
    } else {
      return bulan - 2; // Untuk bulan lainnya, kembalikan bulan dua sebelumnya
    }
  }

  static double parseAndHandleNaNPercent(double value) {
    try {
      var g = intl.NumberFormat("#.#", "en_US");

      if (value.isNaN) {
        return 0;
      } else {
        return double.parse(g.format(value));
      }
    } catch (e) {
      return 0;
    }
  }
}
