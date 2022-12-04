import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';


import '../Map Handling/Constants.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key, required this.title, this.position});
  final String title;
  var position;

  @override
  State<MapPage> createState() => _MapPageState(position: position);
}

class _MapPageState extends State<MapPage> {
  _MapPageState({this.position});
  late MapController mapController;
  var position;
  int name = 1;
  List mapMarkers = [];
  List<LatLng> locations = [];
  double? zoom;

  @override
  void initState()  {
    super.initState();
    mapController = MapController();
    zoom = 13;
  }

  @override
  Widget build(BuildContext context) {
    Geolocator.isLocationServiceEnabled().then((value) => null);
    Geolocator.requestPermission().then((value) => null);
    Geolocator.checkPermission().then(
            (LocationPermission permission)
        {
        }
    );
    Geolocator.getPositionStream(
      locationSettings: LocationSettings(
          accuracy: LocationAccuracy.best
      ),
    ).listen((event) { });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Flutter MapBox'),
      ),
      body: Stack(
        children: [
          Container(
            height: 350,
            child:
              FlutterMap(
                options: MapOptions(
                  minZoom: 5,
                  maxZoom: 30,
                  zoom: zoom!,
                  center: LatLng(position.latitude, position.longitude),
                ),
                mapController: mapController,
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                    "https://api.mapbox.com/styles/v1/ginthushan/claveygzi000y14n0l1lta022/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZ2ludGh1c2hhbiIsImEiOiJjbGF2ZWZpZmUwNHZoM29wa3g3NjQxNTV4In0.722DTaAsNpziwk5eF1Zx-g",
                    additionalOptions: {
                      'mapStyleId': AppConstants.mapBoxStyleId,
                      'accessToken': AppConstants.mapBoxAccessToken,
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      for (int i = 0; i < mapMarkers.length; i++)
                        Marker(
                          height: 40,
                          width: 40,
                          point: mapMarkers[i].location ?? AppConstants.myLocation,
                          builder: (_) {
                            return GestureDetector(
                              onTap: () {},
                              child: Icon(Icons.place
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ],
              ),
          ),
        ],
      ),
      floatingActionButton:
      FloatingActionButton(
        onPressed: () async {
          setState(() {
            setGeoLocation(mapController.center);
            name++;
          });
        },
        child: Icon(Icons.place),
      ),
    );
  }

  setGeoLocation(var position) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placeMark  = newPlace[0];
    String address = "${placeMark.street}, ${placeMark.administrativeArea}, ${placeMark.country}";
    setState(() {
      mapMarkers?.add(GeoLocation(name: name.toString(), address: address, location: mapController.center));
    });
  }
}

class GeoLocation{
  String? name;
  String? address;
  LatLng? location;

  GeoLocation({this.name, this.address, this.location});
}
