// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/models/Dashboard/delivery.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/font.dart';
import 'package:stsj/global/function.dart';

class DeliveryCard extends StatefulWidget {
  const DeliveryCard(
    this.deliveryDetails, {
    this.destinationTime = '',
    super.key,
  });

  final CheckListDetailsModel deliveryDetails;
  final String destinationTime;

  @override
  State<DeliveryCard> createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> {
  // ~:Calculate Time Difference between 2 set of time:~
  String timeDiffCalculation(String time1, String time2) {
    final now = DateTime.now();
    final year = now.year;
    final month = now.month;
    final day = now.day;

    DateTime dateTime1 = DateTime(
      year,
      month,
      day,
      int.parse(time1.split(':')[0]),
      int.parse(time1.split(':')[1]),
    );

    DateTime dateTime2 = DateTime(
      year,
      month,
      day,
      int.parse(time2.split(':')[0]),
      int.parse(time2.split(':')[1]),
    );

    // Calculate the difference as a Duration
    Duration diff = dateTime2.difference(dateTime1);

    // Get the absolute values for hours and minutes
    int hoursDifference = diff.inHours.abs();
    int minutesDifference = diff.inMinutes.abs() % 60;

    // Format the result as a string
    if (hoursDifference == 0) {
      return '$minutesDifference menit';
    } else {
      return '$hoursDifference jam, $minutesDifference menit';
    }
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
                                          onTap: () => GlobalFunction.viewImage(
                                            context,
                                            menuState,
                                            'DETAIL',
                                            menuState.getDeliveryList.isNotEmpty
                                                ? menuState.getDeliveryList[0]
                                                    .activityNumber
                                                : '',
                                            widget.deliveryDetails.transNumber,
                                            shopLat: widget.deliveryDetails.lat,
                                            shopLng: widget.deliveryDetails.lng,
                                            // deliveryDetails.deliveryImageThumb,
                                            deliveryLat: widget
                                                .deliveryDetails.deliveryLat,
                                            deliveryLng: widget
                                                .deliveryDetails.deliveryLng,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text('Durasi'),
                                        ),
                                        SizedBox(width: 5.0),
                                        Expanded(
                                          flex: 2,
                                          child: Builder(
                                            builder: (context) {
                                              print(
                                                'Delivery Time: ${widget.deliveryDetails.deliveryTime}',
                                              );
                                              print(
                                                'Destination Time: ${widget.destinationTime}',
                                              );
                                              if (widget.destinationTime
                                                      .isNotEmpty &&
                                                  widget
                                                      .deliveryDetails
                                                      .deliveryTime
                                                      .isNotEmpty) {
                                                return Text(
                                                  timeDiffCalculation(
                                                    widget.deliveryDetails
                                                        .deliveryTime,
                                                    widget.destinationTime,
                                                  ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text('Note'),
                                        ),
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
                  child: InkWell(
                    onTap: () => GlobalFunction.viewMemo(
                      context,
                      menuState,
                      widget.deliveryDetails.transNumber,
                    ),
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
