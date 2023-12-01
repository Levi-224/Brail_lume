// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async'; // Import the dart:async library

Future<String> getBeaconMajorValue() async {
  final givenUuid = '2d7a9f0c-e0e8-4cc9-a71b-a21db2d034a1';
  String majorValue = ""; // Provide a default value
  if (isAndroid) {
    FlutterBluePlus.turnOn();
  }

  if (await FlutterBluePlus.isSupported == false) {
    print("Bluetooth not supported by this device");
  } else {
    FlutterBluePlus.startScan();
    final scanSubscription = FlutterBluePlus.onScanResults.listen((results) {
      print("Scan results received: $results");
      if (results.isNotEmpty) {
        results.forEach((result) {
          final data = result!.advertisementData;
          if (data.manufacturerData.containsKey(76)) {
            final iBeaconBytes = data.manufacturerData[76]!;
            print("iBeacon Bytes: $iBeaconBytes");

            if (iBeaconBytes != null && iBeaconBytes.length >= 22) {
              final uuid = iBeaconBytes.sublist(2, 18);
              final major = iBeaconBytes.sublist(18, 20);
              final minor = iBeaconBytes.sublist(20, 22);
              final formattedUUID = uuid
                  .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
                  .join();

              print("Formatted UUID: $formattedUUID");

              if (formattedUUID == givenUuid.replaceAll('-', '')) {
                final majorValueInt = (major[0]! << 8 | major[1]!);
                final minorValueInt = (minor[0]! << 8 | minor[1]!);
                print("Major Value Int: $majorValueInt");
                print("Minor Value Int: $minorValueInt");

                majorValue = String.fromCharCode(majorValueInt);
                print("Major Value: $majorValue");
                print("Function completed");
                FlutterBluePlus.stopScan();
              }
            }
          }
        });
      }
    });
    await Future.delayed(Duration(seconds: 8));
    FlutterBluePlus.stopScan();
  }
  // Add a print statement to indicate the function has completed
  return majorValue;
}
