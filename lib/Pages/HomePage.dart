import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfhistory/Pages/MapPage.dart';
import 'package:perfhistory/Pages/MapPage2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'VideoDisplayPage.dart';

class HomePage extends StatelessWidget
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
          child: Text("Come with us to see performances of historical figures on Hofstra’s campus come alive through augmented reality.",
            ),
        ),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("The characters you will see were enacted by students from Dr. Lisa Merrill’s RHET 129 Performing History class in Fall 2021 on the locations you are visiting. They were re-recorded using depth sensing cameras so they could be made available as a digital avatar for future visitors such as you."),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("To access the performances, click SUBMIT and select the relevant location indicated with a blue dot on the map. When asked allow permission for the app to use your camera."),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Headphones are highly recommended."),
          ),
          Spacer(flex: 1,),
          TextButton(child: Text("Submit"), onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (context){return MapPage2();}));}),
          Spacer(flex: 2,)
        ],
      ),
    );
  }

}