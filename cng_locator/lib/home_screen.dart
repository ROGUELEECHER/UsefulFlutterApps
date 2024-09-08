import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late GoogleMapController mapController;

  static const LatLng _center = LatLng(9.0820, 8.6753); // Center of Nigeria

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    GoogleMap(
      onMapCreated: null, // Placeholder, we'll set this up
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 10.0,
      ),
    ),
    Center(child: Text('Conversion Centers')),
    Center(child: Text('Settings')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CNG Locator'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Centers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

