import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Monument
{
  String siteName;
  String videoURL;
  LatLng location;
  String information;

  Monument(this.siteName,this.videoURL,this.location,this.information);
  
  factory Monument.fromDatabase(DocumentSnapshot ds)
  {
    return Monument(ds.get("siteName"), ds.get("videoURL"), LatLng(ds.get("location").latitude,ds.get("location").longitude), ds.get("information"));
  }
}