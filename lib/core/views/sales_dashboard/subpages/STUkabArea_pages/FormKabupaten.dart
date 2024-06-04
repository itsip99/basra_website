import 'package:flutter/material.dart';
import 'package:stsj/static/dataArea.const.dart';
import 'package:searchfield/searchfield.dart';

class FormKabupaten extends StatefulWidget {
  FormKabupaten({super.key});

  static String? kabupaten;

  @override
  State<FormKabupaten> createState() => _FormKabupatenState();
}

class _FormKabupatenState extends State<FormKabupaten> {
  final focus = FocusNode();

  final _searchController = TextEditingController();

  final kabArea = List.generate(DataSalesConst.kabupaten_area.length,
      (index) => DataSalesConst.kabupaten_area[index]);

  @override
  Widget build(BuildContext context) {
    return SearchField(
      onSearchTextChanged: (query) {
        final filter = kabArea
            .where((element) =>
                element.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return filter
            .map((e) => SearchFieldListItem<String>(e,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(e, style: TextStyle(fontSize: 12)),
                )))
            .toList();
      },

      key: Key('searchfield'),
      hint: 'Search by Kabupaten name',
      itemHeight: 50,
      controller: _searchController,
      scrollbarDecoration: ScrollbarDecoration(),
      //   thumbVisibility: true,
      //   thumbColor: Colors.red,
      //   fadeDuration: const Duration(milliseconds: 3000),
      //   trackColor: Colors.blue,
      //   trackRadius: const Radius.circular(10),
      // ),

      suggestionsDecoration: SuggestionDecoration(
          padding: const EdgeInsets.all(4),
          border: Border.all(color: const Color.fromARGB(255, 167, 165, 165)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      suggestions: kabArea
          .map((e) => SearchFieldListItem<String>(e,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(e, style: TextStyle(fontSize: 12)),
              )))
          .toList(),

      focusNode: focus,
      suggestionState: Suggestion.expand,
      onSuggestionTap: (SearchFieldListItem<String> selected) {
        setState(() {
          //dapatkan key
          FormKabupaten.kabupaten = selected.searchKey;

          // masukan ke method fetchGroupbyKab
          // SalesKabArea.fetchGroupbyKab(
          //     SalesKabArea.dataKabAPI, "${FormKabupaten.kabupaten}");
        });

        print('Kabupaten yang dipilih: ${FormKabupaten.kabupaten}');

        focus.unfocus();
      },
    );
  }
}
