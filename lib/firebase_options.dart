// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD6gcuIS2RD2R3jilJJU7SAK5xrXFuFOGI',
    appId: '1:870694166826:web:a719eb68d2314ebb1cbe53',
    messagingSenderId: '870694166826',
    projectId: 'perfhistory-99f17',
    authDomain: 'perfhistory-99f17.firebaseapp.com',
    storageBucket: 'perfhistory-99f17.appspot.com',
    measurementId: 'G-TTKJ93S32D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHZtS1aALn714JsEh17ljY04xDOwNyUo8',
    appId: '1:870694166826:android:c0099f2df18134561cbe53',
    messagingSenderId: '870694166826',
    projectId: 'perfhistory-99f17',
    storageBucket: 'perfhistory-99f17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_9S20HzclJ1lLxxjbBBvww1KpOhGq-Rs',
    appId: '1:870694166826:ios:a9fc4112547669501cbe53',
    messagingSenderId: '870694166826',
    projectId: 'perfhistory-99f17',
    storageBucket: 'perfhistory-99f17.appspot.com',
    iosClientId: '870694166826-qk16ggpfchmr17ijhogo1dj8qbgqdhn7.apps.googleusercontent.com',
    iosBundleId: 'com.hofstra.perfhistory',
  );
}