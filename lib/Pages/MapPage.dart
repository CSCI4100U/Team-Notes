
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';


import '../Map Handling/Constants.dart';
import '../Map Handling/GeoLocation.dart';
import '../Map Handling/GeoLocation_model.dart';


var _model = GeoLocation_model();

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
  List location_list = [];

  @override
  void initState()  {
    super.initState();
    mapController = MapController();
    setList();
  }

  setList() async{
    location_list.clear();
    var y = await _model.getAllLocation();
    setState(() {
      for (GeoLocation locations in y) {
        location_list.add(locations);
      }
    });
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
      locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.best
      ),
    ).listen((event) { });


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Flutter MapBox'),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo)
                ),
                child:
                  FlutterMap(
                    options: MapOptions(
                      minZoom: 5,
                      maxZoom: 30,
                      zoom: 13,
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
                                  child: const Icon(Icons.place
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
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(FlutterI18n.translate(context, "map.title"),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            /*scrollDirection: Axis.vertical,*/
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(
                    label: Text(FlutterI18n.translate(context, "map.address"))
                ),
                DataColumn(
                    label: Text(FlutterI18n.translate(context, "map.city"))
                ),
              ],
                rows: location_list.map((location) => DataRow(
                  onLongPress: (){
                    setState(() {
                      _model.deleteLocationWithAddress(location.address);
                      setList();
                    });
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text(location.address),
                    ),
                    DataCell(
                      Text(location.city),
                    ),
                  ],
                )
                ).toList()
          ),
          )
        ],
      ),
      floatingActionButton:
      FloatingActionButton(
        onPressed: () async {
          setState(() {
            setGeoLocation(mapController.center);
          });
        },
        child: Icon(Icons.place),
      ),
    );
  }

  setGeoLocation(var position) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placeMark  = newPlace[0];
    setState(() {
      location_list.add(GeoLocation(address: placeMark.street, city: placeMark.locality));
      addLocation(GeoLocation(address: placeMark.street, city: placeMark.locality));
      print(placeMark.locality);
    });
  }

  Future addLocation(GeoLocation j) async{
    var x;
    x = await _model.insertLocation(j);
  }
}

