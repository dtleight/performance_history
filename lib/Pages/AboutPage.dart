import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Performing History"),
      ),
      body: Column(
        children: [
          Spacer(flex: 1,),
          Text("Welcome to Performing History.", style: TextStyle(fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Here you will see performances by Hofstra students from Dr. Lisa Merrill’s Performing History class come alive.Come with us, to see performances of historical figures on Hofstra’s campus.The characters you will see were enacted by students from Dr. Lisa Merrill’s RHET 129 Performing History class. Dr. Merrill has been staging reenactments of historical figures in public space during each of the Presidential debates on our campus, in 2008, 20012, and 2016.Students in this class choose a location for their site-specific performance. But live performance is ephemeral --- it disappears after audiences see it. But in THIS project Prof. Kumar has recorded these live student performances on our campus using augmented reality, so join us as we go back in time and journey across the physical and virtual divide while you encounter these historical characters.",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Hear the voices, hidden narratives, and reenactments of the “backstories” behind the statues on our campus, and the historical figures that students have chosen to perform onsite. The performances are over—but thanks to Prof. Kumar’s augmented reality magic, you can see them again.Because of the ephemeral nature of performance, once live historical performances are staged, unfortunately, they no longer exist. However, through our project Prof. Kumar to create an augmented reality clip of Dr. Merrill’s students’ historical performances that will keep them \"alive\" and you with access to the site-specific settings on campus can encounter them in the places that the performers have chosen"),
          ),
          Spacer(flex: 1,),
        ],
      ),
    );
  }

}