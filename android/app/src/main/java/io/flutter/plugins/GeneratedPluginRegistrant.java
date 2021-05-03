package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
    try {
      flutterEngine.getPlugins().add(new com.amolg.flutterbarcodescanner.FlutterBarcodeScannerPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin flutter_barcode_scanner, com.amolg.flutterbarcodescanner.FlutterBarcodeScannerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin flutter_plugin_android_lifecycle, io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin", e);
    }
    try {
      com.aloisdeniel.geocoder.GeocoderPlugin.registerWith(shimPluginRegistry.registrarFor("com.aloisdeniel.geocoder.GeocoderPlugin"));
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin geocoder, com.aloisdeniel.geocoder.GeocoderPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.geolocator.GeolocatorPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin geolocator, com.baseflow.geolocator.GeolocatorPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.googleapiavailability.GoogleApiAvailabilityPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin google_api_availability, com.baseflow.googleapiavailability.GoogleApiAvailabilityPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.location_permissions.LocationPermissionsPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin location_permissions, com.baseflow.location_permissions.LocationPermissionsPlugin", e);
    }
  }
}