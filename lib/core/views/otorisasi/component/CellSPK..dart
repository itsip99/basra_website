import 'package:flutter/material.dart';
import 'package:stsj/core/models/SPKModel/SpkOverDiscModel.dart';
import 'package:stsj/core/views/Otorisasi/component/StyleService.dart';
// import 'package:spk_leasing/modal.dart';
// import 'package:spk_leasing/style_services.dart';
// import 'package:get/get.dart';

class CellSPK extends StatelessWidget {
  //const CellSPK({ Key? key }) : super(key: key);
  final SpkOverDisc spkOverDisc;

  CellSPK(this.spkOverDisc);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey[300]!),
        ),
        padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 8.0),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: Text(
                    spkOverDisc.bSName.toString(),
                    style: StyleService.headLine2
                        .copyWith(color: StyleService.primaryColor),
                  ),
                ),
                Text(
                  spkOverDisc.leasingID.toString(),
                  style: StyleService.headLine3
                      .copyWith(color: StyleService.secondaryColor),
                ),
              ],
            ),
            const SizedBox(height: 10),
            DefaultTextStyle(
              style: StyleService.textStyle.copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white),
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(82),
                  1: FixedColumnWidth(11)
                },
                children: [
                  TableRow(children: [
                    Text('No transaksi'),
                    Text(':'),
                    Text(spkOverDisc.transNO.toString())
                  ]),
                  const TableRow(children: [
                    SizedBox(height: 3),
                    SizedBox(height: 3),
                    SizedBox(height: 3)
                  ]),
                  TableRow(children: [
                    Text('Tanggal trans'),
                    Text(':'),
                    Text(spkOverDisc.transDate.toString())
                  ]),
                  const TableRow(children: [
                    SizedBox(height: 3),
                    SizedBox(height: 3),
                    SizedBox(height: 3)
                  ]),
                  TableRow(children: [
                    Text('Nama Barang'),
                    Text(':'),
                    Text(spkOverDisc.itemName.toString())
                  ]),
                  const TableRow(children: [
                    SizedBox(height: 3),
                    SizedBox(height: 3),
                    SizedBox(height: 3)
                  ]),
                  TableRow(children: [
                    Text('Potongan toko'),
                    Text(':'),
                    Text(StyleService.convertToIdr(spkOverDisc.potonganToko, 0))
                  ]),
                  const TableRow(children: [
                    SizedBox(height: 3),
                    SizedBox(height: 3),
                    SizedBox(height: 3)
                  ]),
                  TableRow(children: [
                    Text('Memo'),
                    Text(':'),
                    Text(spkOverDisc.memo.toString())
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
