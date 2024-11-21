// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/models/Dashboard/delivery.dart';
import 'package:stsj/core/models/Dashboard/delivery_memo.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/datagrid_table.dart';
import 'package:stsj/global/font.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DeliveryCard extends StatefulWidget {
  const DeliveryCard(
    this.deliveryDetails, {
    super.key,
  });

  final CheckListDetailsModel deliveryDetails;

  @override
  State<DeliveryCard> createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> {
  // ~:Image Preview Function:~
  void viewImage(
    BuildContext parentContext,
    MenuState state,
    String activityNumber,
    String shippingNumber,
    double shopLat,
    double shopLng,
    // String img,
    double deliveryLat,
    double deliveryLng,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => FutureBuilder<String>(
        future: state.fetchDeliveryHDImage(
          'DETAIL',
          activityNumber,
          shippingNumber,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(
                minHeight: 5.0,
                color: Colors.black,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('Data not found'),
            );
          } else {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.blue.shade50,
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.0175,
                  vertical: MediaQuery.of(context).size.height * 0.025,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                        child: Image.memory(
                          base64Decode(snapshot.data!),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.325,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                        vertical: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text('Koordinat toko')),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${shopLat.toString()}, ${shopLng.toString()}',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: Text('Koordinat pengiriman')),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${deliveryLat.toString()}, ${deliveryLng.toString()}',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  // ~:Delivery Memo:~
  void viewMemo(MenuState state) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.blue.shade50,
        elevation: 16,
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.0125,
            vertical: MediaQuery.of(context).size.height * 0.025,
          ),
          child: FutureBuilder(
            future: state.fetchDeliveryMemo(
              state.getBranchId,
              state.getShopId,
              widget.deliveryDetails.transNumber,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.black),
                      SizedBox(height: 10),
                      Text(
                        'Loading...',
                        style: GlobalFont.bigfontR,
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('terjadi kesalahan, mohon coba lagi.'),
                );
              } else if (!snapshot.hasData) {
                return Center(child: Text('Data tidak ditemukan'));
              } else {
                final List<DeliveryMemoModel> memos = snapshot.data![0];
                final String status = snapshot.data![1];

                if (status == 'failed') {
                  return Center(child: Text('Gagal memuat data.'));
                } else if (status == 'not found' || status == 'error') {
                  return Center(
                    child: Text('terjadi kesalahan, mohon coba lagi.'),
                  );
                } else {
                  // return Column(
                  //   children: memos.map((e) {
                  //     DeliveryMemoModel memo = e;
                  //
                  //     return Text(
                  //       '${memo.transNumber}, ${memo.transDate}, ${memo.casing.length}',
                  //     );
                  //   }).toList(),
                  // );

                  return SfDataGrid(
                    source: DeliveryDataSource(deliveryData: memos),
                    columnWidthMode: ColumnWidthMode.fill,
                    checkboxShape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    columns: <GridColumn>[
                      GridColumn(
                        columnName: 'transId',
                        width: MediaQuery.of(context).size.width * 0.1,
                        label: Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Text('ID Transaksi'),
                        ),
                      ),
                      GridColumn(
                        columnName: 'date',
                        width: MediaQuery.of(context).size.width * 0.075,
                        label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text('Tanggal'),
                        ),
                      ),
                      GridColumn(
                        columnName: 'duNumber',
                        width: MediaQuery.of(context).size.width * 0.075,
                        label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Nomor DU',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'casingNo',
                        width: MediaQuery.of(context).size.width * 0.1,
                        label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text(
                            'ID Casing',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'koli',
                        width: MediaQuery.of(context).size.width * 0.05,
                        label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Koli',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'caseQty',
                        width: MediaQuery.of(context).size.width * 0.075,
                        label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Jumlah Casing',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'unitId',
                        width: MediaQuery.of(context).size.width * 0.145,
                        label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text(
                            'ID Unit',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'itemName',
                        label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Nama Barang',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'itemQty',
                        width: MediaQuery.of(context).size.width * 0.1,
                        label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Jumlah Barang',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                    stackedHeaderRows: [
                      StackedHeaderRow(
                        cells: [
                          StackedHeaderCell(
                            columnNames: ['casingNo', 'koli', 'caseQty'],
                            child: Center(
                              child: Text(
                                'Casing',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          StackedHeaderCell(
                            columnNames: ['unitId', 'itemName', 'itemQty'],
                            child: Center(
                              child: Text(
                                'Keterangan Casing',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menuState = Provider.of<MenuState>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.01,
        vertical: MediaQuery.of(context).size.height * 0.0175,
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.005,
        horizontal: MediaQuery.of(context).size.height * 0.005,
      ),
      child: Column(
        children: [
          // ~:Filter Result:~
          Container(
            height: MediaQuery.of(context).size.height * 0.055,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.005,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ~:Customer Name:~
                Text(
                  widget.deliveryDetails.customerName,
                  style: GlobalFont.mediumgiantfontRBold,
                ),
                // ~:Delivery Status:~
                Container(
                  // width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.deliveryDetails.deliveryStatus == 0
                        ? widget.deliveryDetails.deliveryTime.isNotEmpty
                            ? Colors.red
                            : Colors.black
                        : Colors.green,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0, 2.0),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                    vertical: 5.0,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.005,
                  ),
                  child: Builder(
                    builder: (context) {
                      if (widget.deliveryDetails.deliveryStatus == 0) {
                        if (widget.deliveryDetails.deliveryTime.isNotEmpty) {
                          return Text(
                            'Gagal terkirim',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return Text(
                            'Belum terkirim',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          );
                        }
                      } else {
                        return Text(
                          'Berhasil terkirim',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          // ~:Filter Result Content:~
          Expanded(
            child: Column(
              children: [
                // ~:Address:~
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.005,
                  ),
                  child: Text(widget.deliveryDetails.shippingAddress),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Row(
                    children: [
                      // ~:Image, Delivery ID, Customer ID:~
                      Expanded(
                        child: Row(
                          children: [
                            Builder(
                              builder: (context) {
                                if (widget.deliveryDetails.deliveryImageThumb
                                    .isNotEmpty) {
                                  return Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.memory(
                                          base64Decode(
                                            widget.deliveryDetails
                                                .deliveryImageThumb,
                                          ),
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                        ),
                                      ),
                                      Positioned(
                                        right: 5.0,
                                        bottom: 5.0,
                                        child: InkWell(
                                          onTap: () => viewImage(
                                            context,
                                            menuState,
                                            menuState.getDeliveryList.isNotEmpty
                                                ? menuState.getDeliveryList[0]
                                                    .activityNumber
                                                : '',
                                            widget.deliveryDetails.transNumber,
                                            widget.deliveryDetails.lat,
                                            widget.deliveryDetails.lng,
                                            // deliveryDetails.deliveryImageThumb,
                                            widget.deliveryDetails.deliveryLat,
                                            widget.deliveryDetails.deliveryLng,
                                          ),
                                          child: Icon(
                                            Icons.fullscreen_rounded,
                                            size: 30.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Icon(
                                      Icons.image_not_supported_outlined,
                                      size: 30.0,
                                    ),
                                  );
                                }
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.005,
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Text('ID pengiriman')),
                                        SizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Builder(
                                            builder: (context) {
                                              if (widget.deliveryDetails
                                                  .transNumber.isNotEmpty) {
                                                return Text(
                                                  widget.deliveryDetails
                                                      .transNumber,
                                                );
                                              } else {
                                                return Text(
                                                  'ID pengiriman tidak tersedia',
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Text('ID pelanggan')),
                                        SizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Builder(
                                            builder: (context) {
                                              if (widget.deliveryDetails
                                                  .customerId.isNotEmpty) {
                                                return Text(
                                                  widget.deliveryDetails
                                                      .customerId,
                                                );
                                              } else {
                                                return Text(
                                                  'ID pelanggan tidak tersedia',
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Text('Pukul')),
                                        SizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Builder(
                                            builder: (context) {
                                              if (widget.deliveryDetails
                                                  .deliveryTime.isNotEmpty) {
                                                return Text(
                                                  widget.deliveryDetails
                                                      .deliveryTime,
                                                );
                                              } else {
                                                return Text('-');
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Text('Note')),
                                        SizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Builder(
                                            builder: (context) {
                                              if (widget.deliveryDetails
                                                  .deliveryNote.isNotEmpty) {
                                                return Text(
                                                  widget.deliveryDetails
                                                      .deliveryNote,
                                                );
                                              } else {
                                                return Text('-');
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ~:Total Documents:~
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.0325,
                          vertical: MediaQuery.of(context).size.height * 0.01,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Total Dokumen',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Invoice',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  widget.deliveryDetails.qtyNota.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Colly',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  widget.deliveryDetails.koli.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // ~:Delivery Details:~
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => viewMemo(menuState),
                    child: Text(
                      'Lihat Detail Pengiriman',
                      style: GlobalFont.mediumbigfontRBoldBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
