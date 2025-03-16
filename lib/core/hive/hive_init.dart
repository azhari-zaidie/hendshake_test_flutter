import 'package:hendshake_test_flutter/core/shared/hive_model/activity_model_local.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'dart:io';
import 'package:flutter/foundation.dart';

/// Initialize Hive and register adapters
Future<void> initHive() async {
  try {
    // Try to get the application documents directory
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  } catch (e) {
    // Fallback for when path_provider fails or for web platform
    if (kIsWeb) {
      // Web doesn't need a path
      Hive.init(null);
    } else {
      // For other platforms, use a temporary directory as fallback
      try {
        final tempDir = Directory.systemTemp;
        Hive.init(tempDir.path);
      } catch (e) {
        // If all else fails, don't initialize path (memory only)
        debugPrint('Failed to initialize Hive with a path: $e');
      }
    }
  }
  
  // Register Hive adapters
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ActivityModelAdapter());
  }
  
  // Open the box
  await Hive.openBox<ActivityModel>('activities');
}