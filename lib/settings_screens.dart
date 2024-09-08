import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'settings_screen.dart';  // Import the settings screen

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

  // Define widget options for the bottom navigation bar
  static final List<Widget> _widgetOptions = <Widget>[
    // Map Screen
    GoogleMap(
      onMapCreated: null,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 10.0,
      ),
    ),
    // Conversion Centers Screen (You can implement this later)
    Center(
      child: Text('Conversion Centers'),
    ),
    // Settings Screen
    SettingsScreen(),  // Navigates to the settings page
  ];

  // Method to handle item taps on the bottom navigation bar
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
      body: _widgetOptions.elementAt(_selectedIndex),  // Display the selected screen
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
        currentIndex: _selectedIndex,  // Highlight the selected item
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,  // Handle taps on the bottom navigation bar
      ),
    );
  }
}
