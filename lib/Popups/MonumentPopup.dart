import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfhistory/Pages/VideoDisplayPage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Objects/Monuments.dart';

class MonumentPopup extends StatelessWidget
{
  Monument monument;
  MonumentPopup(this.monument);

  @override
  Widget build(BuildContext context)
  {
    //TODO:Make smaller
    return AlertDialog(
      title: Center(child: Text(monument.siteName)),
      content: Container(
        height: 400,
        child: Column(children:
        [
          Text(monument.information),
          Spacer(flex: 5,),
          TextButton(onPressed: () async
            {
              //await launch("https://8th.io/6a492");
              await launch(monument.videoURL);
              //Navigator.push(context, new MaterialPageRoute(builder: (context){ return VideoDisplayPage();}));
              },
                child: Text("Proceed")
            ),
          Spacer(flex: 1,)
        ],

        ),
      ),
    );
  }

}