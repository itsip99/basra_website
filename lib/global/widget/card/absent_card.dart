// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stsj/core/models/Report/absent_history.dart';
import 'package:stsj/global/font.dart';

class AbsentCard extends StatefulWidget {
  const AbsentCard(
    this.historyDetails,
    this.date, {
    super.key,
  });

  final SipSalesmanHistoryModel historyDetails;
  final String date;

  @override
  State<AbsentCard> createState() => _AbsentCardState();
}

class _AbsentCardState extends State<AbsentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: (widget.historyDetails.checkIn.isNotEmpty &&
                  widget.historyDetails.checkOut.isNotEmpty)
              ? Colors.transparent
              : Colors.red,
          width: (widget.historyDetails.checkIn.isNotEmpty &&
                  widget.historyDetails.checkOut.isNotEmpty)
              ? 1.0
              : 2.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.01,
        vertical: MediaQuery.of(context).size.height * 0.0175,
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.005,
        horizontal: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Column(
        children: [
          // ~:Address:~
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.005,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.historyDetails.employeeName,
                    style: GlobalFont.bigfontRBold,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.date,
                    style: GlobalFont.mediumbigfontR,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // ~:Image, Delivery ID, Customer ID:~
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.005,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text('Posisi')),
                                  SizedBox(width: 5.0),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      widget.historyDetails.positionName,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text('Penempatan')),
                                  SizedBox(width: 5.0),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${widget.historyDetails.locationName} ${widget.historyDetails.shopName}',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text('Clock In')),
                                  SizedBox(width: 5.0),
                                  Expanded(
                                    flex: 2,
                                    child: Builder(
                                      builder: (context) {
                                        if (widget.historyDetails.checkIn
                                            .isNotEmpty) {
                                          return Text(
                                            widget.historyDetails.checkIn,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text('Clock Out')),
                                  SizedBox(width: 5.0),
                                  Expanded(
                                    flex: 2,
                                    child: Builder(
                                      builder: (context) {
                                        if (widget.historyDetails.checkOut
                                            .isNotEmpty) {
                                          return Text(
                                            widget.historyDetails.checkOut,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
