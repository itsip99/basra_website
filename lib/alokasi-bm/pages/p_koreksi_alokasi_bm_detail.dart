import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stsj/alokasi-bm/helper/api_alokasi_bm.dart';
import 'package:stsj/alokasi-bm/helper/model_alokasi_bm.dart';
import 'package:stsj/alokasi-bm/pages/p_koreksi_alokasi_bm.dart';
import 'package:stsj/alokasi-bm/widget/w_alertdialog_info.dart';
import 'package:stsj/alokasi-bm/widget/w_input_number.dart';
import 'package:stsj/alokasi-bm/widget/w_kolom_detail.dart';
import 'package:stsj/alokasi-bm/widget/w_kolom_header.dart';
import 'package:stsj/alokasi-bm/widget/w_input_search.dart';
import 'package:stsj/alokasi-bm/widget/w_tombol_panjang_ikon.dart';

class PKoreksiAlokasiBMDetail extends StatefulWidget {
  const PKoreksiAlokasiBMDetail(this.tanggal, {super.key});
  final DateTime tanggal;

  @override
  State<PKoreksiAlokasiBMDetail> createState() => _MyPageState();
}

class _MyPageState extends State<PKoreksiAlokasiBMDetail> {
  bool waitAPI = false;
  List<ModelBrowseAlokasi> filter = [];
  TextEditingController searchController = TextEditingController();

  void setSearch(dynamic value) => setState(() =>
      filter = daftarAlokasi.where((x) => x.itemname.contains(value)).toList());

  void simpan() async {
    setState(() => waitAPI = true);

    List<Map> detail = [];
    for (var x in daftarAlokasi) {
      if (x.freestokADJ1.text != '0' ||
          x.freestokADJ2.text != '0' ||
          x.freestokADJ3.text != '0') {
        var fsBagi = x.freestokbagi1 + x.freestokbagi2 + x.freestokbagi3;

        var fsADJ = int.parse(x.freestokADJ1.text) +
            int.parse(x.freestokADJ2.text) +
            int.parse(x.freestokADJ3.text);

        var sisaBagi =
            (x.freestokbisabagi - fsADJ) < 0 ? 0 : (x.freestokbisabagi - fsADJ);

        ((fsBagi + fsADJ) + sisaBagi) > x.sisastok
            ? x.isvalid = false
            : x.isvalid = true;
      }

      if (x.isvalid) {
        detail.add({
          'UnitID': x.unitid,
          'Color': x.color,
          'Qty1': x.freestokADJ1.text,
          'Qty2': x.freestokADJ2.text,
          'Qty3': x.freestokADJ3.text
        });
      }
    }

    var list = daftarAlokasi.where((x) => x.isvalid == false).toList();

    if (list.isNotEmpty) {
      setState(() => waitAPI = false);
      wAlertDialogInfo(context, 'INFORMASI', 'Inputan Melebihi Sisa Stok');
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final userid = prefs.getString('UserID') ?? '';

      var list = await ApiAlokasiBM.revisiAlokasiBM(
          '51', widget.tanggal.toString().substring(0, 10), userid, detail);

      if (msg == 'Sukses') daftarAlokasi = [];
      if (!mounted) return;
      wAlertDialogInfo(context, 'INFORMASI',
          msg == 'Sukses' ? list[0].resultmessage : 'Data Gagal Di Simpan');

      setState(() => waitAPI = false);
    }
  }

  void reset() => setState(() {
        for (var data in daftarAlokasi) {
          data.freestokADJ1.text = '0';
          data.freestokADJ2.text = '0';
          data.freestokADJ3.text = '0';
          data.isvalid = true;
        }
      });

  @override
  void initState() {
    super.initState();
    filter.addAll(daftarAlokasi);
  }

  @override
  Widget build(BuildContext context) {
    if (waitAPI) {
      return Center(child: SpinKitDualRing(color: Colors.blue[900]!));
    } else {
      return SingleChildScrollView(
        child: daftarAlokasi.isEmpty
            ? Container()
            : PaginatedDataTable(
                key: UniqueKey(),
                header:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(child: WInputSearch(searchController, setSearch)),
                ]),
                actions: [
                  WTombolPanjangIkon('SIMPAN', Icons.save, Colors.white,
                      Colors.green[900]!, simpan),
                  WTombolPanjangIkon('RESET', Icons.cleaning_services,
                      Colors.white, Colors.blue[900]!, reset),
                ],
                rowsPerPage: 15,
                source: MyData(list: filter),
                headingRowColor:
                    WidgetStatePropertyAll(Colors.blueGrey.shade300),
                headingRowHeight: 30,
                dataRowMinHeight: 25,
                dataRowMaxHeight: 30,
                columnSpacing: 0,
                horizontalMargin: 0,
                showFirstLastButtons: true,
                showEmptyRows: false,
                columns: [
                  wKolomHeader(context, '', 0.02, MainAxisAlignment.center),
                  wKolomHeader(
                      context, 'KODE BARANG', 0.14, MainAxisAlignment.start),
                  wKolomHeader(context, 'WARNA', 0.06, MainAxisAlignment.start),
                  wKolomHeader(context, 'FS N-1', 0.05, MainAxisAlignment.end),
                  wKolomHeader(
                      context, 'NOTA 1-10', 0.06, MainAxisAlignment.end),
                  wKolomHeader(
                      context, 'SISA STOK', 0.06, MainAxisAlignment.end),
                  wKolomHeader(
                      context, 'FS B CITY', 0.06, MainAxisAlignment.end),
                  wKolomHeader(
                      context, 'FS B OUT', 0.06, MainAxisAlignment.end),
                  wKolomHeader(
                      context, 'FS B NTT', 0.06, MainAxisAlignment.end),
                  wKolomHeader(context, 'FS CITY', 0.06, MainAxisAlignment.end),
                  wKolomHeader(context, 'FS OUT', 0.06, MainAxisAlignment.end),
                  wKolomHeader(context, 'FS NTT', 0.06, MainAxisAlignment.end),
                  wKolomHeader(
                      context, 'BISA BAGI', 0.06, MainAxisAlignment.end),
                  wKolomHeader(
                      context, 'ADJ CITY', 0.06, MainAxisAlignment.center),
                  wKolomHeader(
                      context, 'ADJ OUT', 0.06, MainAxisAlignment.center),
                  wKolomHeader(
                      context, 'ADJ NTT', 0.06, MainAxisAlignment.center),
                ],
              ),
      );
    }
  }
}

class MyData extends DataTableSource {
  MyData({required this.list});
  final List<ModelBrowseAlokasi> list;

  @override
  DataRow? getRow(int index) {
    var posisi = daftarAlokasi.indexWhere(
        (x) => x.unitid == list[index].unitid && x.color == list[index].color);

    void setADJCity(dynamic value) {
      list[index].freestokADJ1 = TextEditingController(text: value);
      daftarAlokasi[posisi].freestokADJ1 = TextEditingController(text: value);
    }

    void setADJOut(dynamic value) {
      list[index].freestokADJ2 = TextEditingController(text: value);
      daftarAlokasi[posisi].freestokADJ2 = TextEditingController(text: value);
    }

    void setADJNTT(dynamic value) {
      list[index].freestokADJ3 = TextEditingController(text: value);
      daftarAlokasi[posisi].freestokADJ3 = TextEditingController(text: value);
    }

    return DataRow(
      color: index % 2 == 0
          ? WidgetStatePropertyAll(Colors.blue.shade50)
          : WidgetStatePropertyAll(Colors.white),
      cells: [
        DataCell(list[index].isvalid
            ? Container()
            : Icon(Icons.info, color: Colors.red)),
        wKolomDetail(list[index].unitid, Alignment.centerLeft),
        wKolomDetail(list[index].colorname, Alignment.centerLeft),
        wKolomDetail(list[index].fsn1.toString(), Alignment.centerRight),
        wKolomDetail(list[index].nota110.toString(), Alignment.centerRight),
        wKolomDetail(list[index].sisastok.toString(), Alignment.centerRight),
        wKolomDetail(
            list[index].freestokbagi1.toString(), Alignment.centerRight),
        wKolomDetail(
            list[index].freestokbagi2.toString(), Alignment.centerRight),
        wKolomDetail(
            list[index].freestokbagi3.toString(), Alignment.centerRight),
        wKolomDetail(list[index].freestok1.toString(), Alignment.centerRight),
        wKolomDetail(list[index].freestok2.toString(), Alignment.centerRight),
        wKolomDetail(list[index].freestok3.toString(), Alignment.centerRight),
        wKolomDetail(
            list[index].freestokbisabagi.toString(), Alignment.centerRight),
        DataCell(WInputNumber('', list[index].freestokADJ1, setADJCity)),
        DataCell(WInputNumber('', list[index].freestokADJ2, setADJOut)),
        DataCell(WInputNumber('', list[index].freestokADJ3, setADJNTT)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}
