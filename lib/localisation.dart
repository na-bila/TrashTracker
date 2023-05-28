

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geoCo;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/controllers/menuAppController.dart';
import 'package:untitled/screens/dashboard/components/header.dart';

import 'constants.dart';
class Localisation extends StatefulWidget {
  const Localisation({Key? key}) : super(key: key);
  @override
  State<Localisation> createState() => _LocalisationState();
}

class _LocalisationState extends State<Localisation> {
  GoogleMapController? mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Position? position;
  String addressLocation="";
  String country='';
  String postalCode="";


  void initMarker(specify, specifyId) async {
    var markerIdVal= specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(specify['latitude'],specify['longitude']),
      infoWindow: InfoWindow(title: 'Trash Can', snippet: specify['Address'])
    );
    setState(() {
      markers[markerId] = marker;
    });
  }



  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker marker = Marker(
        markerId: markerId,
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        infoWindow: InfoWindow(snippet: addressLocation));
    setState(() {
      markers[markerId] = marker;
    });
  }
  getMakerData() async{
    FirebaseFirestore.instance.collection('location').get().then((myMockData){
      for(int i=0;i<myMockData.docs.length;i++){
        initMarker(myMockData.docs[i].data(), myMockData.docs[i].id);

      }
    });
  }

  void getCurrentLocation() async {
    Position currentPosition =
        await GeolocatorPlatform.instance.getCurrentPosition();
    setState(() {
      position = currentPosition;
    });
  }

  @override
  initState() {
    WidgetsFlutterBinding.ensureInitialized();
    getMakerData();
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker(){
      return <Marker> [
        Marker(
          markerId: MarkerId('Trash can'),
          position: LatLng(36.81897,10.165797),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'trashCan'),
        )
      ].toSet();
    }
    return ChangeNotifierProvider(
      create: (_) => MenuAppController(),
      child: Column(
        children: [
          Header(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        child: Scaffold(
                          body: GoogleMap(
                            onTap: (tapped) async {
                              List<Placemark> address = await placemarkFromCoordinates(tapped.latitude,tapped.longitude);
                              //final coordinated = await geoCo.place(tapped.latitude,tapped.longitude);
                              //var address = await geoCo.Geocoder.local.findAddressesFromCoordinates(
                              //    coordinated
                              //);
                              var firstAddress=  address.first;
                              getMarkers(tapped.latitude, tapped.longitude);
                              await FirebaseFirestore.instance.collection('location').add({
                                'latitude': tapped.latitude,
                                'longitude': tapped.longitude,
                                 'Address': firstAddress.name,
                                'country': firstAddress.country,
                                'PostalCode': firstAddress.postalCode
                              });
                              setState(() {
                                country= firstAddress.country!;
                                postalCode= firstAddress.postalCode!;
                                addressLocation= firstAddress.name!;
                              });
                            },
                            mapType: MapType.hybrid,
                            compassEnabled: true,
                            trafficEnabled: true,
                            onMapCreated: (controller) {
                              setState:
                              (() {
                                mapController = controller;
                              });
                            },
                            initialCameraPosition: CameraPosition(
                                target: LatLng(position?.latitude.toDouble() ?? 36.81897 , position?.longitude.toDouble() ?? 10.1657979),
                                zoom: 15.0),
                            markers: Set<Marker>.of(markers.values),
                          ),
                        ),
                      ),
                      Text('Address : $addressLocation'),
                      Text('PostalCode : $postalCode'),
                      Text('Country : $country'),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
  @override
  void dispose(){
    super.dispose();
  }
}
