import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double lat = 27.96144122859129;
  double lng = 76.40153791225701;

  MapController controller = MapController();

  static Marker makeMarker(double lat, double lng) => Marker(
      width: 45.0,
      height: 45.0,
      point: LatLng(lat, lng),
      builder: (context) => Container(
            child: IconButton(
                icon: Icon(
                  Icons.local_parking,
                ),
                onPressed: () {
                  print('Marker tapped!');
                }),
          ));

  Map<String, Marker> mapOfMarkers = {
    "New Delhi": makeMarker(28.6139, 77.2090),
    "Kolkata": makeMarker(22.5726, 88.3639),
  };

  List<DropdownMenuItem> listOfMarkersAsDropDownItems() {
    List<DropdownMenuItem> result = [];

    for (var mapEntry in mapOfMarkers.entries) {
      result.add(DropdownMenuItem(
        child: Text(mapEntry.key.toString()),
        value: mapEntry.value.point,
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Parking App"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            DropdownButton(
              items: listOfMarkersAsDropDownItems(),
              onChanged: (latlng) {
                controller.move(LatLng(latlng.latitude, latlng.longitude), 2.0);
              },
              focusColor: Colors.black,
            ),
            Expanded(
              flex: 8,
              child: Container(
                child: FlutterMap(
                    mapController: controller,
                    options:
                        MapOptions(minZoom: 10.0, center: LatLng(lat, lng)),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(markers: mapOfMarkers.values.toList())
                    ]),
              ),
            ),
          ],
        ));
  }
}
