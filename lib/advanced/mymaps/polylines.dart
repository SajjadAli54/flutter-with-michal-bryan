import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

class MyMapPoly extends StatefulWidget {
  const MyMapPoly({super.key});

  @override
  State<MyMapPoly> createState() => _MyMapPolyState();
}

class _MyMapPolyState extends State<MyMapPoly> {
  late List<latlng.LatLng> points;
  late MapController mapController;
  late Map<String, latlng.LatLng> coords;
  late List<Marker> markers;

  late String _selectedCity;

  @override
  void initState() {
    super.initState();

    points = <latlng.LatLng>[
      latlng.LatLng(24.8607, 67.0011),
      latlng.LatLng(31.5497, 74.3436),
      latlng.LatLng(33.6844, 73.0479),
      latlng.LatLng(32.5000, 74.5333),
    ];

    mapController = MapController();
    coords = <String, latlng.LatLng>{
      "Karachi": latlng.LatLng(24.8607, 67.0011),
      "Lahore": latlng.LatLng(31.5497, 74.3436),
      "Islamabad": latlng.LatLng(33.6844, 73.0479),
      "Peshawar": latlng.LatLng(34.0007, 71.5140),
      "Quetta": latlng.LatLng(30.1798, 66.9750),
      "Faisalabad": latlng.LatLng(31.4180, 73.0791),
      "Multan": latlng.LatLng(30.2000, 71.4550),
      "Gujranwala": latlng.LatLng(32.1656, 74.1880),
      "Hyderabad": latlng.LatLng(25.3811, 68.3750),
      "Rawalpindi": latlng.LatLng(33.6007, 73.0679),
      "Sargodha": latlng.LatLng(32.0833, 72.6667),
      "Sialkot": latlng.LatLng(32.5000, 74.5333),
      "Bahawalpur": latlng.LatLng(29.4000, 71.6833),
      "Sukkur": latlng.LatLng(27.7000, 68.8667),
      "Sheikhupura": latlng.LatLng(31.7095, 73.9897),
      "Larkana": latlng.LatLng(27.5614, 68.2144),
      "Gujrat": latlng.LatLng(32.5783, 74.0750),
      "Jhang": latlng.LatLng(31.2744, 72.3256),
      "Sahiwal": latlng.LatLng(30.6667, 73.1167),
      "Dera Ghazi Khan": latlng.LatLng(30.0569, 70.6353),
      "Mardan": latlng.LatLng(34.2011, 72.0456),
      "Kasur": latlng.LatLng(31.1150, 74.4461),
      "Rahim Yar Khan": latlng.LatLng(28.4200, 70.2950),
      "Okara": latlng.LatLng(30.8081, 73.4458),
      "Wah Cantonment": latlng.LatLng(33.7211, 73.9972),
      "Mingora": latlng.LatLng(34.7811, 72.3614),
      "Nawabshah": latlng.LatLng(26.2450, 68.4100),
      "Mirpur Khas": latlng.LatLng(25.5333, 69.0167),
      "Chiniot": latlng.LatLng(31.7189, 72.9789),
      "Khanewal": latlng.LatLng(30.3000, 71.8000),
      "Kamoke": latlng.LatLng(31.9833, 74.9000),
      "Jacobabad": latlng.LatLng(28.2833, 68.4333),
      "Dera Ismail Khan": latlng.LatLng(31.8333, 70.9000),
      "Kohat": latlng.LatLng(33.5833, 71.4333),
      "Mandi Bahauddin": latlng.LatLng(32.6000, 73.0667),
      "Vehari": latlng.LatLng(33.5200, 72.3500),
      "Sadiqabad": latlng.LatLng(28.3000, 70.1333),
      "Khanpur": latlng.LatLng(28.6500, 70.6500),
      "Tando Allahyar": latlng.LatLng(25.4667, 68.8333),
      "Chishtian Mandi": latlng.LatLng(29.8000, 72.3333),
      "Hafizabad": latlng.LatLng(32.0833, 73.3167),
      "Jhelum": latlng.LatLng(32.9333, 73.7333),
      "Kamalia": latlng.LatLng(30.1000, 72.3167),
      "Khanqah Sharif": latlng.LatLng(31.7000, 73.4500),
      "Muzaffargarh": latlng.LatLng(30.0750, 71.1931),
      "Nankana Sahib": latlng.LatLng(31.3667, 73.9833),
      "Tando Adam": latlng.LatLng(25.4667, 68.8333),
      "Toba Tek Singh": latlng.LatLng(30.9833, 72.5333),
      "Wazirabad": latlng.LatLng(32.4500, 74.0667),
      "Ahmadpur East": latlng.LatLng(29.1500, 71.2500),
      "Arifwala": latlng.LatLng(30.4167, 73.0667),
      "Attock City": latlng.LatLng(33.7667, 72.3667),
      "Burewala": latlng.LatLng(30.1667, 72.6833),
      "Chakwal": latlng.LatLng(32.9333, 72.8667),
      "Charsadda": latlng.LatLng(34.1500, 71.7333),
      "Daska": latlng.LatLng(32.3333, 74.4500),
      "Dera Bugti": latlng.LatLng(29.0333, 69.1667),
      "Dipalpur": latlng.LatLng(30.6667, 73.1167),
      "Duki": latlng.LatLng(32.1667, 70.9000),
      "Ghotki": latlng.LatLng(28.0167, 69.1667),
      "Haroonabad": latlng.LatLng(29.1500, 72.6833),
      "Hasilpur": latlng.LatLng(29.7000, 72.3167),
      "Haveli Lakha": latlng.LatLng(30.9833, 72.5333),
      "Jaranwala": latlng.LatLng(31.3333, 73.4333),
      "Jauharabad": latlng.LatLng(31.3333, 72.6833),
      "Kabirwala": latlng.LatLng(31.5000, 74.4500),
      "Kahror Pakka": latlng.LatLng(29.4500, 71.6833),
      "Kambar": latlng.LatLng(30.9833, 72.5333),
      "Kandhkot": latlng.LatLng(28.3000, 69.4500),
      "Kanganpur": latlng.LatLng(32.4500, 74.0667),
      "Khairpur": latlng.LatLng(27.5333, 68.7167),
      "Kharian": latlng.LatLng(32.4500, 74.0667),
      "Khushab": latlng.LatLng(32.3000, 72.3500),
      "Kot Addu": latlng.LatLng(30.9833, 72.5333),
      "Matiari": latlng.LatLng(25.8833, 68.7500),
      "Odero Lal Station": latlng.LatLng(32.4500, 74.0667),
      "Pano Aqil": latlng.LatLng(32.4500, 74.0667),
      "Pasni": latlng.LatLng(25.2667, 63.4833),
      "Pattoki": latlng.LatLng(32.4500, 74.0667),
      "Pir Mahal": latlng.LatLng(32.4500, 74.0667),
      "Qadirpur Ran": latlng.LatLng(32.4500, 74.0667),
    };
    markers = <Marker>[
      ...points.map(
        (value) => Marker(
          width: 80.0,
          height: 80.0,
          point: value,
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.red,
          ),
        ),
      ),
    ];

    _selectedCity = coords.keys.first;
  }

  void _showCoord(int index) {
    setState(() {
      _selectedCity = coords.keys.elementAt(index);
    });
    mapController.move(coords.values.elementAt(index), 10.0);
  }

  Widget makeDropDownButtons() {
    final keys = coords.keys;
    final DropdownButton<String> button = DropdownButton(
        value: _selectedCity,
        items: keys
            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        onChanged: (value) => _showCoord(keys.toList().indexOf(value!)));

    return button;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        makeDropDownButtons(),
        Flexible(
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: latlng.LatLng(27.7244, 68.8228),
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
                maxZoom: 22,
              ),
              MarkerLayer(markers: markers),
              PolylineLayer(polylines: [
                Polyline(points: points, strokeWidth: 4.0, color: Colors.purple)
              ])
            ],
          ),
        ),
      ],
    ));
  }
}
