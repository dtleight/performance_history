import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:perfhistory/Pages/AboutPage.dart';
import 'package:perfhistory/Popups/MonumentPopup.dart';
import 'package:perfhistory/Utilities/DatabaseRouter.dart';

import '../Objects/Monuments.dart';
import 'CreditsPage.dart';
import 'HomePage.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  final CameraPosition schoolCenter = CameraPosition(
      bearing: 160,
      target: LatLng(40.713679, -73.600247),
      tilt: 25,
      zoom: 17.000000);

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = {};

    return Scaffold(
      appBar: AppBar(
        title: Text("Performance History"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("About Page"),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (ctxt) {
                  return AboutPage();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.my_location),
              title: Text("Location Tool"),
              onTap: () async {
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

                // When we reach here, permissions are granted and we can
                // continue accessing the position of the device.
                Position pos = await Geolocator.getCurrentPosition();
                print(pos);
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: Text(
                      pos.longitude.toString() + "," +
                          pos.latitude.toString()),);
                });

              },
            ),
            ListTile(
              leading: Icon(Icons.text_snippet),
              title: Text("Credits"),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (ctxt) {
                  return CreditsPage();
                }));
              },
            )
          ],
        ),
      ),
      body: FutureBuilder(
          future: DatabaseRouter().getMonuments(),
          builder: (context, AsyncSnapshot<List<Monument>> snapshot) {
            if (snapshot.hasData) {
              List<Monument> monuments = snapshot.data ?? [];
              for (Monument m in monuments) {
                markers.add(new Marker(
                    markerId: MarkerId(m.siteName),
                    position: m.location,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return MonumentPopup(m);
                          });
                    }));
              } //btb
              return GoogleMap(
                mapType: MapType.satellite,
                indoorViewEnabled: true,
                buildingsEnabled: false,
                // myLocationButtonEnabled: true,
                markers: markers,
                initialCameraPosition: schoolCenter,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
