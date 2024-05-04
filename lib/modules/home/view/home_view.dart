import 'dart:async';
import 'dart:ffi';

import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/modules/home/controller/home_controller.dart';
import 'package:pikup_app/modules/home/widgets/drawer_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put<HomeController>(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: Stack(
        children: [
          Obx(
            () => CustomGoogleMapMarkerBuilder(
                customMarkers: controller.customMarkers.value,
                builder: (context, markers) {
                  return GoogleMap(
                    mapType: MapType.terrain,
                    initialCameraPosition: CameraPosition(
                      target: controller.initialPosition.value,
                      zoom: 18,
                    ),
                    onMapCreated: (GoogleMapController mapController) {
                      controller.mapController = mapController;
                      controller.trackLocation();
                    },
                    minMaxZoomPreference: const MinMaxZoomPreference(0, 70),
                    markers: Set<Marker>.of(markers ?? []),
                    zoomControlsEnabled: false,
                    compassEnabled: false,
                    indoorViewEnabled: true,
                    mapToolbarEnabled: true,
                    onCameraIdle: () {},
                  );
                }),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.whiteOff,
        child: DrawerWidget(),
      ),
    );
  }
}
