import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tap_on/Home%20page.dart';
import 'package:tap_on/user-renttools/Nearby_Tool_Shops.dart';

class TLocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<TLocationPage> {
  final TextEditingController _locationController = TextEditingController();
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(8.569, 81.234); // Default to Kinniya

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        backgroundColor: Colors.amber[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Location Input Field
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Enter Your Location',
                hintText: 'e.g. City, Postal Code',
                border: OutlineInputBorder(),
              ),
            ),
            // Search Button
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add search functionality here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.amber[700],
              ),
              child: Container(
                width: 500, // Set the desired width here
                child: Text('Search',textAlign: TextAlign.center,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Map Display
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 14.0,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Continue Button at the Bottom
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NearbyToolRantPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.black,
                    foregroundColor: Colors.yellow, // Button color
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
