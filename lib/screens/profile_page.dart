// volunteer page

import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:platform_maps_flutter/platform_maps_flutter.dart'; 
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(



//       // Semantics v2
//       // child: Semantics(
//       //   button: true,
//       //   enabled: true,
//       //   label: 'Clickable text here!',
//       //   child: GestureDetector(
//       //     onTap: () {
//       //       print('Clicked!');
//       //     }, child: Text('Click Me!', style: TextStyle(fontSize: 56))
//       //   ),
//       // ),
//       // Semantics v1
//       // child: Center(
//       //   child: Semantics(
//       //       label: 'This is profile page.', 
//       //       child: Image.network('https://images.unsplash.com/photo-1617251137884-f135eccf6942?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80'),
//       //       // child: const Text(
//       //       //   'View past purchases'
//       //       // ),
//       //   ),
//       // ),
//     );
//   }
// }

class MapScreen extends StatefulWidget {
  const MapScreen({ Key? key }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(1.3521, 103.8198), 
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;
  final Set<Marker> markers = new Set();
  
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  //markers for google map
  LatLng startLocation = LatLng(1.3551, 103.8486);  
  LatLng amk = LatLng(1.3695, 103.8484); 
  LatLng bishan = LatLng(1.3507, 103.8488);
  static const LatLng showLocation = const LatLng(27.7089427, 85.3086209);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller, 
        markers: getmarkers(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

   Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(startLocation.toString()),
        position: startLocation, //position of marker
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(amk.toString()),
        position: amk, //position of marker
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(bishan.toString()),
        position: bishan, //position of marker
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Ping this volunteer for help?'),
                content: Text('Doing this would allow volunteer to use your phone'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('YES')),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('NO')),                      
                ],
              );
            },
          );
        },
      ));

       //add more markers here 
    });

    return markers;
  }
}