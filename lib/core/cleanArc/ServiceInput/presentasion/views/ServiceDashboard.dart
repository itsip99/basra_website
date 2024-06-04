import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stsj/core/cleanArc/ServiceInput/Data/model/Service.dart';
import 'package:stsj/core/cleanArc/ServiceInput/Domain/DTO/DTOlistReport.dart';
import 'package:stsj/core/cleanArc/ServiceInput/Domain/usecase/serviceDashboard_usecase.dart';
import 'package:stsj/core/cleanArc/ServiceInput/Repository/ServiceReportRepository.dart';
import 'package:stsj/core/cleanArc/ServiceInput/presentasion/controller/serviceDashboardController.dart';
import 'package:stsj/global/FilterByTahun.dart';
import 'package:stsj/global/globalVar.dart';
import 'package:stsj/router/router_const.dart';
import 'package:stsj/global/widget/app_bar.dart';
import 'package:flutter/services.dart';

class ServiceInput extends StatefulWidget {
  const ServiceInput({super.key});

  @override
  State<ServiceInput> createState() => _ServiceInputState();
}

class _ServiceInputState extends State<ServiceInput> {
  double fontsize = 14;

  final serviceDashboardController = Get.put(ServiceDashboardController());

  final serviceRepo = ServiceRepository();

  final serviceuseCase = ServiceDashbarodUsecase();

  int currentYear = DateTime.now().year;

  bool loading = true;

  bool loadingTable = false;

  bool adaDataTable = false;

  bool isInput = false;

  // List<Map<String, dynamic>> bulan = [
  //   {"name": "1", "value": true},
  //   {"name": "2", "value": true},
  //   {"name": "3", "value": true},
  //   {"name": "4", "value": true},
  //   {"name": "5", "value": true},
  //   {"name": "6", "value": true},
  //   {"name": "7", "value": true},
  //   {"name": "8", "value": true},
  //   {"name": "9", "value": true},
  //   {"name": "10", "value": true},
  //   {"name": "11", "value": true},
  //   {"name": "12", "value": true},
  // ];

  // List<Map<String, dynamic>> teritori = [
  //   {"name": "TERR IV", "value": true},
  //   {"name": "TERR VIII", "value": true},
  // ];

  List<Map<String, dynamic>> data = [];

  List<Map<String, String>> dataKosong = [
    // {
    //   'KODE DPACK': '',
    //   'NAMA DEALER': '',
    //   'KOTA': '',
    //   'MEKANIK': '',
    //   'KSG1': '',
    //   'KSG2': '',
    //   'KSG3': '',
    //   'KSG4': '',
    //   'Unit Entry': '',
    //   'LABOUR': '',
    //   'WorkshopPart': '',
    //   'WorkshopOli': '',
    //   'RetailPart': '',
    //   'RetailOli': ''
    // },
  ];

  void confirmPostReport(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogcontext) {
        return AlertDialog(
          title: Text(
            "Konfirmasi",
            style: TextStyle(fontSize: 16),
          ),
          content: Text("Apakah Anda yakin ingin menyimpan laporan?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogcontext).pop(); // Tutup dialog
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogcontext).pop(); // Tutup dialog

                // Panggil postReport() jika pengguna menekan "Ya"

                postReport(
                  context,
                );
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  void postReport(BuildContext context,
      {String selectedTahun = '',
      String selectedBulan = '',
      String userid = ''}) async {
    try {
      bool isSuccess = await serviceuseCase.postService(data,
          tahun: serviceDashboardController.selectedtahun,
          bulan: serviceDashboardController.selectedBulan,
          userid: GlobalVar.username);

      if (isSuccess) {
        // Tampilkan dialog konfirmasi jika pengiriman berhasil

        data.clear();

        setState(() {
          loadingTable = false;
          adaDataTable = false;
          isInput = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext dialogcontext) {
            return AlertDialog(
              title: Text(
                "Notifikasi",
                style: TextStyle(fontSize: 16),
              ),
              content: Text("Laporan berhasil disimpan."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogcontext).pop(); // Tutup dialog
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Tangani kesalahan jika terjadi
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Terjadi kesalahan saat mengirim Data",
              style: TextStyle(fontSize: 16),
            ),
            content: Text("$e"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Tutup dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  bool _onKey(KeyEvent event) {
    final key = event.logicalKey;

    if (event is KeyDownEvent && key == LogicalKeyboardKey.insert) {
      addData();
    }

    // if (event is KeyDownEvent && key == LogicalKeyboardKey.delete) {
    //   if (data.isNotEmpty) {
    //     removeData(data.last);
    //   }
    // }

    return false;
  }

  fetchLoadData() async {
    setState(() {
      loadingTable = true;
    });
    try {
      data = await serviceRepo.fetchServiceReport(ServiceReportDTO(
          territori: serviceDashboardController
              .teritori(serviceDashboardController.selectedteritori),
          tahun: serviceDashboardController.selectedtahun,
          bulan: serviceDashboardController.selectedBulan));

      if (data.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext dialogcontext) {
            return AlertDialog(
              title: Row(
                children: const [
                  Icon(Icons.warning), // Icon ditambahkan di sini
                  SizedBox(
                      width:
                          5), // Memberikan sedikit jarak antara ikon dan teks
                  Text(
                    "Notifikasi",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              content: Text("Tidak Ada Data"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogcontext).pop(); // Tutup dialog
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        adaDataTable = true;
        isInput = true;
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext dialogcontext) {
          return AlertDialog(
            title: Row(
              children: const [
                Icon(
                  Icons.warning,
                  size: 20,
                ), // Icon ditambahkan di sini
                SizedBox(
                    width: 5), // Memberikan sedikit jarak antara ikon dan teks
                Text(
                  "Terjadi kesalahan",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            content: Text(
              "Cause: $e",
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(dialogcontext).pop(); // Tutup dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } finally {
      loadingTable = false;

      setState(() {});
    }
  }

  browse() {
    fetchLoadData();
  }

  Future<void> setDateList() async {
    // Mendapatkan tahun dan bulan saat ini
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;

    serviceDashboardController.listTahun = List.generate(4, (index) {
      int year = currentYear - index;
      return {"name": year.toString()};
    });

    serviceDashboardController.listBulan = List.generate(12, (index) {
      int bulan = index + 1;
      String bulanString = bulan.toString().padLeft(2, '0');
      return {"name": bulanString};
    });

    // Menambahkan 5 tahun terakhir ke listTahun
    // for (int year = currentYear; year <= currentYear ; year++) {
    //   listTahun.add({"name": year.toString()});
    // }

    // // Menambahkan bulan-bulan dari Januari hingga Desember ke listBulan
    // for (int bulan = 1; bulan <= 12; bulan++) {
    //   String bulanString = bulan < 10 ? '0$bulan' : bulan.toString();
    //   listBulan.add({"name": bulanString});
    // }

    // Mengatur nilai default untuk selectedBulan dan selectedtahun

    serviceDashboardController.setselectedbulan(
        currentMonth < 10 ? '0$currentMonth' : currentMonth.toString());
    serviceDashboardController.setselectedtahun(currentYear.toString());

    // Memperbarui tampilan setelah selesai

    serviceDashboardController.setselecteteritori(
        (serviceDashboardController.listTeritori.first['name']));

    print(serviceDashboardController.selectedBulan);
    print(serviceDashboardController.selectedtahun);
    print(serviceDashboardController.selectedteritori);

    // fetchLoadData();

    setState(() {
      loading = false;
    });
  }

  void init() {
    setDateList();

    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(goBack: RoutesConstant.menu),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [buildFilterHeader(), buildBody()],
          ),
        ),
      ),
    );
  }

  Widget buildFilterHeader() {
    return Row(
      children: [
        loading || isInput
            ? SizedBox()
            : FilterByLeasingRadio(
                listItem: serviceDashboardController.listTahun,
                title: 'TAHUN',
                desc: 'PILIH TAHUN',
                onSelect: serviceDashboardController.setselectedtahun,
                selected: serviceDashboardController.selectedtahun,
              ),
        SizedBox(
          width: 15,
        ),
        loading || isInput
            ? SizedBox()
            : FilterByLeasingRadio(
                listItem: serviceDashboardController.listBulan,
                title: 'BULAN',
                desc: 'PILIH BULAN',
                onSelect: serviceDashboardController.setselectedbulan,
                selected: serviceDashboardController.selectedBulan,
              ),
        SizedBox(
          width: 15,
        ),
        loading || isInput
            ? SizedBox()
            : FilterByLeasingRadio(
                listItem: serviceDashboardController.listTeritori,
                title: 'TERITORI',
                desc: 'PILIH TERITORI',
                onSelect: serviceDashboardController.setselecteteritori,
                selected: serviceDashboardController.selectedteritori,
              ),
        Expanded(child: SizedBox()),
        adaDataTable && data.isNotEmpty
            ? Container(
                width: 120,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    data.clear();
                    adaDataTable = false;
                    isInput = false;

                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.cancel_presentation, color: Colors.black54),
                      SizedBox(width: 5),
                      Text('CANCEL'),
                    ],
                  ),
                ),
              )
            : SizedBox(),
        !adaDataTable && data.isEmpty
            ? Container(
                width: 120,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    browse();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.create, color: Colors.black54),
                      SizedBox(width: 5),
                      Text('BARU'),
                    ],
                  ),
                ),
              )
            : SizedBox(),
        adaDataTable && data.isNotEmpty
            ? Container(
                width: 120,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    confirmPostReport(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.save, color: Colors.black54),
                      SizedBox(width: 5),
                      Text('SIMPAN'),
                    ],
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Widget buildBody() {
    return loadingTable
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              _buildTableHeader(),

              _buildTableContent(),
              // _addData()
              // GestureDetector(child: _containerTable('+ TAMBAH'))
            ],
          );
  }

  Widget _buildTableHeader() {
    return Container(
        child: Row(
      children: [
        Expanded(child: _containerTable('KODE DPACK')),
        Expanded(flex: 3, child: _containerTable('NAMA DEALER')),
        Expanded(flex: 3, child: _containerTable('KOTA')),
        Expanded(child: _containerTable('MEKANIK')),
        Expanded(child: _containerTable('KSG1')),
        Expanded(child: _containerTable('KSG2')),
        Expanded(child: _containerTable('KSG3')),
        Expanded(child: _containerTable('KSG4')),
        Expanded(child: _containerTable('Unit Entry')),
        Expanded(child: _containerTable('Labour')),
        Expanded(child: _containerTable('Workshop Part')),
        Expanded(child: _containerTable('Workshop Oli')),
        Expanded(child: _containerTable('Retail Part')),
        Expanded(child: _containerTable('Retail Oli')),
      ],
    ));
  }

  Widget _buildTableContent() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: data.length, // Hanya satu item dalam ListView
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: TextFormField(
                  enabled: false,
                  initialValue:
                      data[index]['KODE DPACK'] ?? '', // Isi awal dari kolom
                  onChanged: (value) {
                    // Di sini Anda bisa menangani perubahan nilai
                    data[index]['KODE DPACK'] = value;
                  },
                  style: TextStyle(fontSize: 11.5), // Ukuran font
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white, // Warna latar belakang
                    filled: false,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    enabled: false,

                    initialValue:
                        data[index]['NAMA DEALER'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['NAMA DEALER'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: false,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    enabled: false,

                    initialValue:
                        data[index]['KOTA'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['KOTA'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: false,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue:
                        data[index]['MEKANIK'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['MEKANIK'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue:
                        data[index]['KSG1'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['KSG1'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue:
                        data[index]['KSG2'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['KSG2'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue:
                        data[index]['KSG3'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['KSG3'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue:
                        data[index]['KSG4'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['KSG4'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue:
                        data[index]['Unit Entry'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['Unit Entry'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue:
                        data[index]['LABOUR'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['LABOUR'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue: data[index]['WorkshopPart'] ??
                        '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['WorkshopPart'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue:
                        data[index]['WorkshopOli'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['WorkshopOli'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue:
                        data[index]['RetailPart'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['RetailPart'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [CustomNumberInputFormatter()],
                    initialValue:
                        data[index]['RetailOli'] ?? '', // Isi awal dari kolom
                    onChanged: (value) {
                      // Di sini Anda bisa menangani perubahan nilai
                      data[index]['RetailOli'] = value;
                    },
                    style: TextStyle(fontSize: 11.5), // Ukuran font

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white, // Warna latar belakang
                      filled: true,
                    ),
                  ),
                ),
              ),
              // Tambahkan Expanded dan TextFormField untuk setiap kolom lainnya
            ],
          );
        },
      ),
    );
  }

  void addData() {
    data.add(
      {
        'KODE DPACK': '',
        'NAMA DEALER': '',
        'KOTA': '',
        'MEKANIK': '',
        'KSG1': '',
        'KSG2': '',
        'KSG3': '',
        'KSG4': '',
        'Unit Entry': '',
        'LABOUR': '',
        'WorkshopPart': '',
        'WorkshopOli': '',
        'RetailPart': '',
        'RetailOli': ''
      },
    );

    setState(() {});
  }

  void removeData(Map<String, String> rowData) {
    data.remove(rowData);

    setState(() {});
  }

  Widget _addData() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
              onTap: () {
                addData();
              },
              child: _containerTable('+', color: 100, fontsize: 12)),
        ),
        for (int i = 1; i <= 14; i++)
          Expanded(
              flex: i == 1 || i == 2 ? 3 : 1,
              child: _containerTable('', color: 100)),
      ],
    );
  }

  Widget _containerTable(String title,
      {int? color = 300, double fontsize = 11.3}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFA2D6F9),
        border: Border.all(
          color: Colors.grey, // Warna border
          width: 1.0, // Lebar border
        ),
      ),
      child: Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "fontdashboard",
                color: Colors.black,
                fontSize: fontsize)),
      ),
    );
  }
}

class CustomNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Menggunakan pola regex untuk memeriksa apakah nilai baru sesuai dengan format yang diinginkan
    RegExp regex = RegExp(r'^\d{0,}([.,]\d{0,4})?$');

    String sanitizedInput = newValue.text.replaceAll(',', '.');

    if (regex.hasMatch(sanitizedInput)) {
      // Jika nilai baru sesuai dengan pola regex, maka kembalikan nilai baru
      return newValue.copyWith(text: sanitizedInput);
    } else {
      // Jika tidak sesuai, kembalikan nilai lama
      return oldValue;
    }
  }
}
