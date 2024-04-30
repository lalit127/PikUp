import 'dart:async';
import 'dart:ffi';

import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/modules/home/controller/home_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      //
                      // LatLng destination = widget.orderModel.shippingAddress !=
                      //         null
                      //     ? LatLng(
                      //         double.parse(
                      //             widget.orderModel.shippingAddress.latitude),
                      //         double.parse(
                      //             widget.orderModel.shippingAddress.longitude))
                      //     : controller.initialPosition;
                      //
                      // controller.getPolyline(
                      //     from: controller.initialPosition, to: destination);
                      // controller.setFromToMarker(
                      //     from: controller.initialPosition, to: destination);
                      controller.trackLocation();
                    },
                    minMaxZoomPreference: const MinMaxZoomPreference(0, 70),
                    markers: Set<Marker>.of(markers ?? []),
                    // polylines: {
                    //   if (controller.info != null)
                    //     Polyline(
                    //         polylineId: const PolylineId('overview_polyline'),
                    //         color: Colors.blue,
                    //         width: 5,
                    //         points: controller.info.polylinePoints
                    //             .map((e) => LatLng(e.latitude, e.longitude))
                    //             .toList())
                    // },
                    zoomControlsEnabled: false,
                    compassEnabled: false,
                    indoorViewEnabled: true,
                    mapToolbarEnabled: true,
                    onCameraIdle: () {},
                    // onCameraMove: ((_position) => _cameraPosition = _position),
                  );
                }),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Profile'),
              leading: SvgPicture.asset(Assets.icons.icProfile),
            )
          ],
        ),
      ),
    );
  }
}
