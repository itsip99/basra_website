import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/models/Dashboard/delivery.dart';
import 'package:stsj/core/models/Dashboard/delivery_history.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/function.dart';
import 'package:stsj/global/widget/app_bar.dart';
import 'package:stsj/global/widget/delivery_map_button.dart';
import 'package:stsj/router/router_const.dart';

class DeliveryMap extends StatelessWidget {
  const DeliveryMap({super.key});

  @override
  Widget build(BuildContext context) {
    final menuState = Provider.of<MenuState>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.065,
        ),
        child: CustomAppBar(
          goBack: RoutesConstant.delivery,
        ),
      ),
      body: Builder(
        builder: (context) {
          List<DeliveryModel> delivery = menuState.getDeliveryList;
          List<DeliveryHistoryModel> history = menuState.getDeliveryHistoryList;

          if (delivery.isEmpty) {
            return Center(
              child: Text('Data not found'),
            );
          } else {
            List<CheckListDetailsModel> detail = delivery[0].deliveryDetail;

            return FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(
                  detail[0].lat,
                  detail[0].lng,
                ),
                initialZoom: 15.0,
              ),
              children: [
                // ~:Map Layer or Image:~
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.stsj',
                ),

                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.125,
                    height: MediaQuery.of(context).size.height * 0.15,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: EdgeInsets.only(top: 10, right: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalFunction.showLegend(
                          Colors.green,
                          'Berhasil terkirim',
                        ),
                        SizedBox(height: 5),
                        GlobalFunction.showLegend(
                          Colors.red,
                          'Gagal terkirim',
                        ),
                        SizedBox(height: 5),
                        GlobalFunction.showLegend(
                          Colors.black,
                          'Belum terkirim',
                        ),
                      ],
                    ),
                  ),
                ),

                // ~:Branches Location:~
                MarkerLayer(
                  markers: delivery[0].deliveryDetail.asMap().entries.map(
                    (e) {
                      CheckListDetailsModel detail = e.value;

                      if (detail.deliveryStatus == 0) {
                        if (detail.deliveryTime.isNotEmpty) {
                          return Marker(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.2,
                            point: LatLng(
                              detail.lat,
                              detail.lng,
                            ),
                            child: deliveryMapButton(
                              detail.customerName,
                              0,
                              counter: detail.deliveryOrder != 99
                                  ? detail.deliveryOrder.toString()
                                  : '0',
                            ),
                          );
                        } else {
                          return Marker(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.2,
                            point: LatLng(
                              detail.lat,
                              detail.lng,
                            ),
                            child: deliveryMapButton(
                              detail.customerName,
                              2,
                              counter: detail.deliveryOrder != 99
                                  ? detail.deliveryOrder.toString()
                                  : '0',
                            ),
                          );
                        }
                      } else {
                        return Marker(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.2,
                          point: LatLng(
                            detail.lat,
                            detail.lng,
                          ),
                          child: deliveryMapButton(
                            detail.customerName,
                            1,
                            counter: detail.deliveryOrder != 99
                                ? detail.deliveryOrder.toString()
                                : '0',
                          ),
                        );
                      }
                    },
                  ).toList(),
                ),

                // ~:Delivery Polylines:~
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: history.map((e) {
                        return LatLng(
                          double.parse(e.lat),
                          double.parse(e.lng),
                        );
                      }).toList(),
                      strokeWidth: 5.0,
                      color: Colors.blue[700]!,
                    ),
                  ],
                  polylineCulling: false,
                ),

                // ~:Truck Last Position:~
                MarkerLayer(
                  markers: [
                    Marker(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.2,
                      point: LatLng(
                        double.parse(
                          history[menuState.getDeliveryHistoryList.length - 1]
                              .lat,
                        ),
                        double.parse(
                          history[menuState.getDeliveryHistoryList.length - 1]
                              .lng,
                        ),
                      ),
                      child: Icon(
                        Icons.fire_truck_outlined,
                        color: Colors.grey[800],
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
