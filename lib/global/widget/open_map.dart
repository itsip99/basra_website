import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/widget/app_bar.dart';
import 'package:stsj/router/router_const.dart';

class OpenMap extends StatelessWidget {
  const OpenMap({super.key});

  @override
  Widget build(BuildContext context) {
    final openMapState = Provider.of<MapState>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          goBack: RoutesConstant.managerActivities,
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(
            openMapState.getLat,
            openMapState.getLng,
          ),
          initialZoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.stsj.sipsales',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 110.0,
                point: LatLng(
                  openMapState.getLat,
                  openMapState.getLng,
                ),
                child: Icon(
                  Icons.location_on_rounded,
                  color: Colors.black,
                  size: 50.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
