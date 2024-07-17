import 'package:flutter/material.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({super.key});

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(
          MediaQuery.of(context).size.width * 0.25,
        ),
        1: FlexColumnWidth(
          MediaQuery.of(context).size.width * 0.25,
        ),
        2: FlexColumnWidth(
          MediaQuery.of(context).size.width * 0.25,
        ),
        3: FlexColumnWidth(
          MediaQuery.of(context).size.width * 0.25,
        ),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                alignment: Alignment.center,
                child: Text('Briefing Salesman'),
              ),
            ),
            TableCell(
              child: Center(
                child: Text(
                  'Keliling dan Kunjungan Market',
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Text(
                  'Kunjungan dan Laporan Harian Salesman',
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Text(
                  'Recruitment & Interview Salesman',
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  1: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  2: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  3: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  4: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  5: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  6: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                },
                children: const [
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: Text('Senin'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Selasa'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Rabu'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Kamis'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Jumat'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Sabtu'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Total'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TableCell(
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  1: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  2: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  3: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  4: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  5: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  6: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                },
                children: const [
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: Text('Senin'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Selasa'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Rabu'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Kamis'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Jumat'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Sabtu'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Total'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TableCell(
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  1: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  2: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  3: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  4: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  5: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  6: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                },
                children: const [
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: Text('Senin'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Selasa'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Rabu'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Kamis'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Jumat'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Sabtu'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Total'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TableCell(
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  1: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  2: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  3: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  4: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  5: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                  6: FlexColumnWidth(
                    MediaQuery.of(context).size.width * 0.15,
                  ),
                },
                children: const [
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: Text('Senin'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Selasa'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Rabu'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Kamis'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Jumat'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Sabtu'),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Total'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
