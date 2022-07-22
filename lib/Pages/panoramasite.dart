// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hayan_app/Pages/homepage.dart';
import 'package:panorama/panorama.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  int _panoId = 0;
  List<Image> panoImages = [
    Image.asset('assets/vr/0002.jpg'),
    Image.asset('assets/vr/0003.jpg'),
    Image.asset('assets/vr/0004.jpg'),
    Image.asset('assets/vr/0005.jpg'),
    Image.asset('assets/vr/0006.jpg'),
    Image.asset('assets/vr/0007.jpg'),
    Image.asset('assets/vr/0008.jpg'),
    Image.asset('assets/vr/0009.jpg'),
    Image.asset('assets/vr/00010.jpg'),
    Image.asset('assets/vr/00011.jpg'),
    Image.asset('assets/vr/00012.jpg'),
  ];
  ImagePicker picker = ImagePicker();

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      _lon = longitude;
      _lat = latitude;
      _tilt = tilt;
    });
  }

  Widget hotspotButton(
      {String? text, IconData? icon, VoidCallback? onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.black38),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Icon(icon),
          onPressed: onPressed,
        ),
        text != null
            ? Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    switch (_panoId % panoImages.length) {
      case 0:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0004.jpg'),
          hotspots: [
            Hotspot(
              latitude: -42.0,
              longitude: -5.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_circle_up_outlined,
                  onPressed: () => setState(() => _panoId = 4)),
            ),
            Hotspot(
              latitude: -42.0,
              longitude: -85.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_circle_up_outlined,
                  onPressed: () => setState(() => _panoId = 7)),
            ),
          ],
        );
        break;
      case 2:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0003.jpg'),
          hotspots: [
            Hotspot(
              latitude: 0.0,
              longitude: -46.0,
              width: 90.0,
              height: 75.0,
              widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.double_arrow,
                  onPressed: () => setState(() => _panoId++)),
            ),
          ],
        );
        break;
      case 3:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0002.jpg'),
          hotspots: [
            Hotspot(
              latitude: -42.0,
              longitude: -5.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.search,
                  onPressed: () => setState(() => _panoId = 5)),
            ),
          ],
        );
        break;
      case 4:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0005.jpg'),
          hotspots: [
            Hotspot(
              latitude: -60.0,
              longitude: -240.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.search,
                  onPressed: () => setState(() => _panoId = 0)),
            ),
          ],
        );
        break;
      case 5:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0006.jpg'),
          hotspots: [
            Hotspot(
              latitude: -42.0,
              longitude: -5.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.search,
                  onPressed: () => setState(() => _panoId = 4)),
            ),
          ],
        );
        break;
      case 6:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0007.jpg'),
          hotspots: [
            Hotspot(
              latitude: -42.0,
              longitude: -5.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_downward_outlined,
                  onPressed: () => setState(() => _panoId = 7)),
            ),
          ],
        );
        break;
      case 7:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0008.jpg'),
          hotspots: [
            Hotspot(
              latitude: -60.0,
              longitude: -155.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_circle_up_rounded,
                  onPressed: () => setState(() => _panoId = 6)),
            ),
            Hotspot(
              latitude: -60.0,
              longitude: -60.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_circle_up_rounded,
                  onPressed: () => setState(() => _panoId = 8)),
            ),
            Hotspot(
              latitude: -60.0,
              longitude: -250.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_circle_up_rounded,
                  onPressed: () => setState(() => _panoId = 0)),
            ),
          ],
        );
        break;
      case 8:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0009.jpg'),
          hotspots: [
            Hotspot(
              latitude: -60.0,
              longitude: -155.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_circle_up_rounded,
                  onPressed: () => setState(() => _panoId = 6)),
            ),
            Hotspot(
              latitude: -60.0,
              longitude: -155.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.arrow_circle_up_rounded,
                  onPressed: () => setState(() => _panoId = 8)),
            ),
          ],
        );
        break;
      case 9:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0010.jpg'),
          hotspots: [
            Hotspot(
              latitude: -42.0,
              longitude: -5.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.search,
                  onPressed: () => setState(() => _panoId = 4)),
            ),
          ],
        );
        break;
      case 10:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0011.jpg'),
          hotspots: [
            Hotspot(
              latitude: -42.0,
              longitude: -5.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.search,
                  onPressed: () => setState(() => _panoId = 4)),
            ),
          ],
        );
        break;
      case 11:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0012.jpg'),
          hotspots: [
            Hotspot(
              latitude: -42.0,
              longitude: -5.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.search,
                  onPressed: () => setState(() => _panoId = 4)),
            ),
          ],
        );
        break;
      case 12:
        panorama = Panorama(
          sensitivity: 2,
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0013.jpg'),
          hotspots: [
            Hotspot(
              latitude: -42.0,
              longitude: -5.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.search,
                  onPressed: () => setState(() => _panoId = 4)),
            ),
          ],
        );
        break;
      default:
        panorama = Panorama(
          animSpeed: 1.0,
          sensorControl: SensorControl.Orientation,
          onViewChanged: onViewChanged,
          child: Image.asset('assets/vr/0005.jpg'),
          hotspots: [
            Hotspot(
              latitude: -60.0,
              longitude: 130.0,
              width: 90.0,
              height: 75.0,
              widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.double_arrow,
                  onPressed: () => setState(() => _panoId = 3)),
            ),
          ],
        );
    }
    return Scaffold(
      body: Stack(
        children: [
          panorama,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Icon(Icons.panorama),
      ),
    );
  }
}
