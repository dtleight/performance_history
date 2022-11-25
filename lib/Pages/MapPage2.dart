import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../Objects/Monuments.dart';
import '../Popups/MonumentPopup.dart';
import '../Utilities/DatabaseRouter.dart';
import 'AboutPage.dart';
import 'CreditsPage.dart';

class MapPage2 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return MapPage2State();
  }
}

class MapPage2State extends State<MapPage2>
{

  final CameraPosition schoolCenter = CameraPosition(
      bearing: 160,
      target: LatLng(40.713679, -73.600247),
      tilt: 25,
      zoom: 16.000000);

  late MapboxMapController controller;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Performing History"),
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
      body: MapboxMap(
                  accessToken: "pk.eyJ1IjoiZHRsZWlnaHQiLCJhIjoiY2wyZGdwa3gxMHoybDNucGRibzQxYnBodiJ9.1ZwXh-O1kLYiqgGvOpCZ7w",
                  myLocationEnabled: true,
                  myLocationRenderMode: MyLocationRenderMode.GPS,
                  myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
                  //cameraTargetBounds: ,
                  onStyleLoadedCallback: loadMarkers,
                  onMapCreated: (MapboxMapController controller){
                    this.controller = controller;},
                  initialCameraPosition: schoolCenter),
    );
  }

  void loadMarkers() async
  {

    List<Monument> monuments = await DatabaseRouter().getMonuments();
    for(Monument m in monuments)
    {
      print("Constructing circle");
      setState(() {
        controller.addCircle(
          CircleOptions(
          geometry: new LatLng(m.location.latitude, m.location.longitude),
          circleRadius: 10,
          circleColor: '#0b31db',
        ),
          {
            "monument": m,
          }
        );
      });
    }
    controller.onCircleTapped.add((Circle c) {showDialog(context: context, builder: (context) {return MonumentPopup(c.data!['monument']!);});});
  }

}