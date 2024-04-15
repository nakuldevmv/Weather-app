import 'package:flut/Pages/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController()); // Initialize LocationController

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Location and Weather'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Latitude:'),
              Obx(() => Text(
                  '${LocationController.to.latitude}')), // Use GetX for reactive updates
              const Text('Longitude:'),
              Obx(() => Text('${LocationController.to.longitude}')),
              const Text('Weather:'),
              Obx(() => Text(LocationController.to.weatherDescription)),
              ElevatedButton(
                onPressed: LocationController.to.getLocation,
                child: const Text('Get Location and Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
