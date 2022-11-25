import 'package:cloud_firestore/cloud_firestore.dart';

import '../Objects/Monuments.dart';

class DatabaseRouter
{
  Future<List<Monument>> getMonuments() async {
    List<Monument> monuments = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('monuments').get();
    snapshot.docs.forEach((element) {
      monuments.add(Monument.fromDatabase(element));
    });
    return monuments;
  }
}