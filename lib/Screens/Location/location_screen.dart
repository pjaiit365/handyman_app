// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors, library_private_types_in_public_api, unused_element, prefer_const_constructors

import 'dart:async';
import 'package:geolocator_platform_interface/src/enums/location_accuracy.dart'
    as loc;
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _mapController;
  LocationData? _currentLocation;
  bool _shouldMoveCamera = true;

  DatabaseReference _databaseRef = FirestoreDatabase.instance.ref();
  Marker? _destinationMarker;
  StreamSubscription<DatabaseEvent>?
      _destinationStreamSubscription; // Store the stream subscription

  @override
  void initState() {
    super.initState();
    _getLocation();
    _getDestinationCoordinates();
  }

  @override
  void dispose() {
    // Cancel the stream subscription when the widget is disposed
    _destinationStreamSubscription?.cancel();
    super.dispose();
  }

  void _listenToDestinationCoordinates() {
    DatabaseReference destinationRef =
        _databaseRef.child('your_destination_node');

    // Start listening to changes in the destination coordinates
    _destinationStreamSubscription = destinationRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        double? destinationLatitude = data['f_latitude'] as double?;
        double? destinationLongitude = data['f_longitude'] as double?;

        if (destinationLatitude != null && destinationLongitude != null) {
          // Now, you have the updated destination latitude and longitude.
          // You can use this data to update the marker on the map or draw a route from the current location to the destination location if you want.

          if (_mapController != null) {
            // Move the camera to the bus's updated destination location
            _mapController!.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(destinationLatitude, destinationLongitude),
                  zoom: 15.0,
                ),
              ),
            );

            // Update the marker for the bus destination
            setState(() {
              _destinationMarker = Marker(
                markerId: MarkerId('bus_destination'),
                position: LatLng(destinationLatitude, destinationLongitude),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              );
            });
          }
        }
      }
    });
  }

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: loc.LocationAccuracy.high);

    print(position);
  }

  Future<void> _getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled on the device
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check if the app has permission to access the location
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get the current location
    _currentLocation = await location.getLocation();

    if (_mapController != null) {
      // Move the camera to the user's current location
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
                _currentLocation!.latitude!, _currentLocation!.longitude!),
            zoom: 15.0,
          ),
        ),
      );
    }

    _currentLocation = await location.getLocation();
    print(
        "Current Location: ${_currentLocation?.latitude}, ${_currentLocation?.longitude}");
  }

  Future<void> _getDestinationCoordinates() async {
    DatabaseReference destinationRef = _databaseRef.child('GPS');

    // Set up a stream to listen for changes in the destination coordinates
    destinationRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        double? destinationLatitude = data['f_latitude'] as double?;
        double? destinationLongitude = data['f_longitude'] as double?;

        if (destinationLatitude != null && destinationLongitude != null) {
          // Now, you have the updated destination latitude and longitude.
          // You can use this data to update the marker on the map or draw a route from the current location to the destination location if you want.

          if (_mapController != null) {
            // Move the camera to the bus's updated destination location
            // _mapController!.animateCamera(
            //   CameraUpdate.newCameraPosition(
            //     CameraPosition(
            //       target: LatLng(destinationLatitude, destinationLongitude),
            //       zoom: 15.0,
            //     ),
            //   ),
            // );

            // Update the marker for the bus destination
            setState(() {
              _destinationMarker = Marker(
                markerId: MarkerId('bus_destination'),
                position: LatLng(destinationLatitude, destinationLongitude),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              );
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            cameraTargetBounds: CameraTargetBounds(LatLngBounds(
              northeast: LatLng(6.755010, -1.423322),
              southwest: LatLng(6.599917, -1.748450),
            )),
            initialCameraPosition: CameraPosition(
              target: LatLng(0, 0), // Placeholder initial camera position
              zoom: 15.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            markers: {
              if (_currentLocation != null)
                Marker(
                  markerId: MarkerId('user_location'),
                  position: LatLng(_currentLocation!.latitude!,
                      _currentLocation!.longitude!),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                ),
              // Add a marker for the bus destination using destinationLatitude and destinationLongitude
              if (_destinationMarker != null)
                _destinationMarker!, // Show the bus destination marker if it's not null
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: FloatingActionButton(
                        elevation: 10,
                        backgroundColor: Colors.grey[50],
                        foregroundColor: Colors.blueGrey,
                        onPressed: () {
                          _shouldMoveCamera = true; // Enable camera movements
                          getLocation();
                        },
                        child: const Icon(Icons.my_location),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
