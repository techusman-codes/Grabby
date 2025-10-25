import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grabby_app/core/constant/app_routes.dart';
import 'package:grabby_app/core/constant/app_string.dart';
import 'package:grabby_app/screens/onboaring/widgets/primary_bottom.dart';
import 'package:grabby_app/screens/onboaring/widgets/text_button_link.dart';
import 'package:grabby_app/core/utils/location_helper.dart';

class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({super.key});

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
  // ✅ Use Completer instead of nullable controller (best practice)
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng? _currentPosition;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  // ✅ Fetch and update user location safely
  Future<void> _getLocation() async {
    final hasPermission = await LocationHelper.requestPermission();
    if (!hasPermission) {
      setState(() => _isLoading = false);
      return;
    }

    final position = await LocationHelper.getCurrentLocation();
    if (position != null) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });

      // ✅ Move camera smoothly to current position if map is ready
      if (_controller.isCompleted) {
        final controller = await _controller.future;
        controller.animateCamera(
          CameraUpdate.newLatLngZoom(_currentPosition!, 15),
        );
      }
    } else {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🗺️ Google Map View
          Positioned.fill(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _currentPosition == null
                ? const Center(child: Text("Unable to get location"))
                : GoogleMap(
                    onMapCreated: (controller) {
                      if (!_controller.isCompleted) {
                        _controller.complete(controller);
                      }
                    },
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition!,
                      zoom: 15,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                  ),
          ),

          // ⬆️ Bottom Card Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    AppStrings.geoText,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.geoDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextButtonLink(
                          text: "Skip ",

                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/activate-account',
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: PrimaryButton(
                          text: "Use Location",
                          onPressed: () async {
                            setState(() => _isLoading = true);
                            await _getLocation();
                            if (_currentPosition != null) {
                              // Navigate to home screen after the location is fetch
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.main_screen,
                              );
                            } else {
                              const SnackBar(
                                content: Text(
                                  'Unable to get location Please try again later',
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
