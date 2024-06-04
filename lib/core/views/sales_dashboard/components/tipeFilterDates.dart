import 'package:flutter/material.dart';

class FilterDates extends StatefulWidget {
  static int tanggalFilter = 0;

  static int yearFilter = 0;
  static int bulanFilter = 0;
  static int bulanprev = 0;
  static int bulansecondprev = 0;
  static DateTime? selectedDate;
  static DateTime? selectedDateEnd;
  static DateTime? picked;

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FilterDates> {
  // Menyimpan tanggal yang dipilih

  @override
  void initState() {
    super.initState();

    print('Filter awal day ${FilterDates.tanggalFilter}');
    print('Filter awal bulan ${FilterDates.bulanFilter}');
    print('Filter awal tahun ${FilterDates.yearFilter}');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 20)),
            ),
            onPressed: () {
              _showMonthYearPicker();
            },
            child: Row(
              children: [
                Text('Filter By Date'),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMonthYearPicker() async {
    FilterDates.picked = await showDatePicker(
      context: context,
      initialDate: FilterDates.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2101),

      initialEntryMode: DatePickerEntryMode.calendarOnly, // Mode input
      selectableDayPredicate: (DateTime date) {
        // Hanya memungkinkan bulan dan tahun
        return true;
      },
      locale: Locale("en",
          "US"), // Atur bahasa ke Inggris untuk memastikan format bulan dan tahun yang benar
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Warna header
            hintColor: Colors.blue, // Warna icon
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    setState(() {
      if (FilterDates.picked != null &&
          FilterDates.picked != FilterDates.selectedDate) {
        FilterDates.selectedDate = FilterDates.picked;
        FilterDates.tanggalFilter = FilterDates.picked!.day;
        FilterDates.bulanFilter = FilterDates.picked!.month;
        FilterDates.yearFilter = FilterDates.picked!.year;
        FilterDates.bulanprev = FilterDates.picked!.month - 1;
        FilterDates.bulansecondprev = FilterDates.picked!.month - 2;
      }
      print('Filter day ${FilterDates.tanggalFilter}');

      print('Filter bulan ${FilterDates.bulanFilter}');
      print('Filter tahun ${FilterDates.yearFilter}');
    });
  }
}
