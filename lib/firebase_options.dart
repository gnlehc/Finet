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
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCmqiFH0vsuTfLs-fwbDVoDZL4kpAarsdg',
    appId: '1:754197928310:web:bd8025ed5fd1b7ac0b0257',
    messagingSenderId: '754197928310',
    projectId: 'finet-e3fa2',
    authDomain: 'finet-e3fa2.firebaseapp.com',
    storageBucket: 'finet-e3fa2.appspot.com',
    measurementId: 'G-NYP76TF000',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFy8pTqInIv_vgaYYFWxcsu3c8oMdjdmw',
    appId: '1:754197928310:android:ef59d89ba75518ab0b0257',
    messagingSenderId: '754197928310',
    projectId: 'finet-e3fa2',
    storageBucket: 'finet-e3fa2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrOYsD4zpIKf2BOw2BSFc1ruTHGHlc2Zg',
    appId: '1:754197928310:ios:53e769537c0483b00b0257',
    messagingSenderId: '754197928310',
    projectId: 'finet-e3fa2',
    storageBucket: 'finet-e3fa2.appspot.com',
    iosBundleId: 'com.example.finet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrOYsD4zpIKf2BOw2BSFc1ruTHGHlc2Zg',
    appId: '1:754197928310:ios:e5f1b0d7f86089d90b0257',
    messagingSenderId: '754197928310',
    projectId: 'finet-e3fa2',
    storageBucket: 'finet-e3fa2.appspot.com',
    iosBundleId: 'com.example.finet.RunnerTests',
  );
}
