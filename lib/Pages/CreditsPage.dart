import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditsPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Performing History"),),
      body: Center(
        child: Column(
          children: [
            Text(""),
            Text("Co-created by",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Dr. Lisa Merrill"),
            Text("Prof. Aashish Kumar"),
            Text(""),
            Text("Hologram capture and AR creation", style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Prof Kumar"),
            Text(""),
            Text("App design and coding",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Dalton Leight"),
            Text(""),
            Text("Production Assistant",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Katherine Chwe"),
            Text(""),
            Text("Featured Student Performers",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Niralee Rana"),
            Text("Sydney Marburg"),
            Text("Marianne Perrino"),
            Text("Athena Dawson"),
            Text(""),
            Text("Funding provided by",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Lawrence Herbert School of Communication"),
            Text("Hofstra College of Liberal Arts and Sciences"),
            Text("Rabinowitz Honors College"),
          ],
        ),
      ),
    );
  }

}