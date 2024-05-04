import 'dart:async';
import 'package:get/get.dart';
import 'package:location/location.dart' as locator;
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pikup_app/common/common_import.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pikup_app/routes/app_pages.dart';

class HomeController extends GetxController {
  Rx<String> currentAddress = ''.obs;
  Rx<Position>? currentPosition;
  GoogleMapController? mapController;

  RxList<MarkerData> customMarkers = <MarkerData>[].obs;
  Rx<LatLng> initialPosition = LatLng.new(0.0, 0.0).obs;

  List<DrawerModel> drawerList = <DrawerModel>[
    DrawerModel(
        title: 'My Profile',
        leadingIcon: Assets.icons.icProfile,
        routes: Routes.HOME),
    DrawerModel(
        title: 'My Ride',
        leadingIcon: Assets.icons.icRide,
        routes: Routes.HOME),
    DrawerModel(
        title: 'Favourite',
        leadingIcon: Assets.icons.icHeart,
        routes: Routes.HOME),
    DrawerModel(
        title: 'Premium',
        leadingIcon: Assets.icons.icProfile,
        routes: Routes.HOME),
    DrawerModel(
        title: 'Security',
        leadingIcon: Assets.icons.icShield,
        routes: Routes.HOME),
    DrawerModel(
        title: 'Earn Coins',
        leadingIcon: Assets.icons.icEarn,
        routes: Routes.HOME),
    DrawerModel(
        title: 'Rewards',
        leadingIcon: Assets.icons.icRewards,
        routes: Routes.HOME),
    DrawerModel(
        title: 'Notification',
        leadingIcon: Assets.icons.icNotification,
        routes: Routes.HOME),
    DrawerModel(
        title: 'Payment',
        leadingIcon: Assets.icons.icEarn,
        routes: Routes.HOME),
    DrawerModel(
        title: 'Support',
        leadingIcon: Assets.icons.icReferEarn,
        routes: Routes.HOME)
  ];

  getCurrentLocation() async {
    try {
      Position newLocalData = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentPosition?.value = newLocalData;
      LatLng newPosition = LatLng(
          currentPosition!.value.latitude, currentPosition!.value.longitude);
      initialPosition.value = newPosition;
      if (mapController != null) {
        mapController?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: newPosition, zoom: 15)));
      }
      // _distance = await getDistanceInKM(
      //     newPosition,
      //     LatLng(double.parse(Get.find<OrderController>().selectedOrderLat),
      //         double.parse(Get.find<OrderController>().selectedOrderLng)));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showSnackBar(
          'Location services are disabled. Please enable the services');
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      getCurrentLocation();
      return true;
    } else if (permission == LocationPermission.deniedForever) {
      showSnackBar(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    } else {
      // Handle other cases if needed
      return false;
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  final List<Marker> markers = <Marker>[];

  getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            currentPosition!.value.latitude, currentPosition!.value.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress.value =
          '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}';
    });
  }

  trackLocation() async {
    locator.Location location = locator.Location();
    location.onLocationChanged.listen((location) async {
      initialPosition.value = LatLng(location.latitude!, location.longitude!);
      LatLng newPosition = initialPosition.value;
      updateUserMarker();
      if (mapController != null) {
        mapController?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: newPosition, zoom: 15)));
      }
      // _distance = await getDistanceInKM(
      //     newPosition,
      //     LatLng(double.parse(Get.find<OrderController>().selectedOrderLat),
      //         double.parse(Get.find<OrderController>().selectedOrderLng)));
      // print("location changed");
      // updatePolyline();
    });
    update();
  }

  updateUserMarker() {
    final String driverMarkerId = 'id-0';
    if (customMarkers.isEmpty)
      customMarkers.add(MarkerData(
        marker: Marker(
          markerId: const MarkerId('id-0'),
          position: initialPosition.value,
        ),
        child: SvgPicture.asset(Assets.icons.icProfile, height: 50, width: 50),
      ));
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  // Future<PermissionStatus> requestNotificationPermission() async {
  //   final status = await Permission.notification.request();
  //   return status;
  // }
  //
  // Future<PermissionStatus> requestLocationPermission() async {
  //   final status = await Permission.location.request();
  //   return status;
  // }
}

class DrawerModel {
  String title;
  String leadingIcon;
  String routes;

  DrawerModel(
      {required this.title, required this.leadingIcon, required this.routes});
}
