// lib/screens/location/location_permission_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grabby_app/screens/home/main_screen.dart';

import '../onboaring/widgets/primary_bottom.dart';

class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  // Initial camera position centered on a default location (e.g., Lagos)
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(6.5244, 3.3792),
    zoom: 12.0,
  );

  // --- Location Permission Logic ---
  Future<void> _requestLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1. Check if location services are enabled on the device
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showErrorAndProceed(
        'Location services are disabled. Please enable them.',
      );
      return;
    }

    // 2. Check and request permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _showErrorAndProceed(
          'Location access was denied. You can enable it later.',
        );
        return;
      }
    }

    // 3. Permission Granted!
    _navigateToNextScreen();
  }

  void _showErrorAndProceed(String message) {
    // Show a temporary message to the user
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
    // Proceed to the next screen (treating denial as a skip)
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: _navigateToNextScreen,
        ),
        title: const Text(
          'Set Location',
          style: TextStyle(color: Colors.black),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: [
          // 1. Map View (The visual background)
          SizedBox(
            height: screenHeight,
            width: double.infinity,
            child: const GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              zoomControlsEnabled: false, // Clean UI
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              // Map interaction disabled until permission is granted
              scrollGesturesEnabled: false,
            ),
          ),

          // 2. Floating Bottom Panel (The white card overlay)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // 💡 REMOVE the fixed height calculation (e.g., height: screenHeight * 0.35)
              // We will let the content dictate the height, or use a much smaller minimum height.
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 32.0,
                left: 32.0,
                right: 32.0,
                bottom: 20.0,
              ), // Added bottom padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              // 🚀 FIX: Wrap the inner content in a SingleChildScrollView
              child: SingleChildScrollView(
                // 💡 Crucial: Wrap the content in a Column and use MainAxisSize.min
                // to ensure the scroll view only takes the necessary height.
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // This makes the column only as tall as its children
                  children: [
                    // Title
                    Text(
                      'Enable your location',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            // ...
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),

                    // Description
                    Text(
                      'To search for nearby merchants, We want to know your location',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        // ...
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Buttons
                    // 💡 Ensure the buttons row has appropriate padding if necessary
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20.0,
                      ), // Padding below the buttons
                      child: Row(
                        children: [
                          // Skip Button
                          Expanded(
                            child: TextButton(
                              onPressed: _navigateToNextScreen,
                              child: const Text('Skip'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Use Location Button
                          Expanded(
                            child: PrimaryButton(
                              text: 'Use Location',
                              onPressed: _requestLocationPermission,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
