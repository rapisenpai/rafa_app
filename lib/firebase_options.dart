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
    apiKey: 'AIzaSyBybajda-XEbjzONxbExUCUGy5a6LkByUM',
    appId: '1:415868007044:web:2b998a9f97ed3bff7ac8d1',
    messagingSenderId: '415868007044',
    projectId: 'travelix-6a236',
    authDomain: 'travelix-6a236.firebaseapp.com',
    storageBucket: 'travelix-6a236.appspot.com',
    measurementId: 'G-DTTXS1ZZ68',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlpGo3EsVQpxjDhwr2Q0fv77mZ12okirc',
    appId: '1:415868007044:android:5900cd1bd55cba7c7ac8d1',
    messagingSenderId: '415868007044',
    projectId: 'travelix-6a236',
    storageBucket: 'travelix-6a236.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeyGIMg-aMktRVrlwC9Pbux4P4M7HNONk',
    appId: '1:415868007044:ios:2a52444424ec29ff7ac8d1',
    messagingSenderId: '415868007044',
    projectId: 'travelix-6a236',
    storageBucket: 'travelix-6a236.appspot.com',
    iosBundleId: 'com.example.rafaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBeyGIMg-aMktRVrlwC9Pbux4P4M7HNONk',
    appId: '1:415868007044:ios:12647ced0ab19bc07ac8d1',
    messagingSenderId: '415868007044',
    projectId: 'travelix-6a236',
    storageBucket: 'travelix-6a236.appspot.com',
    iosBundleId: 'com.example.rafaApp.RunnerTests',
  );
}
