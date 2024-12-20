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
    apiKey: 'AIzaSyC4pCf2SOSFibG4G9tgb5BPCttuxdyB7-s',
    appId: '1:95886331175:web:73048c55776d6fc54aed02',
    messagingSenderId: '95886331175',
    projectId: 'my-art-7cfa0',
    authDomain: 'my-art-7cfa0.firebaseapp.com',
    storageBucket: 'my-art-7cfa0.appspot.com',
    measurementId: 'G-TR0T7DRFP1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7VIYduWUoeFnPLLQ_7_0UfQMQ3GHXqDo',
    appId: '1:95886331175:android:f1d6b88644da45f44aed02',
    messagingSenderId: '95886331175',
    projectId: 'my-art-7cfa0',
    storageBucket: 'my-art-7cfa0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2O4azJyjeYlSAv5fWa3jha8QqNeyqhns',
    appId: '1:95886331175:ios:4ecb1ca4ec993dc04aed02',
    messagingSenderId: '95886331175',
    projectId: 'my-art-7cfa0',
    storageBucket: 'my-art-7cfa0.appspot.com',
    iosClientId: '95886331175-8bk8acoqn92pb1ips8u830k4e7cqcj5t.apps.googleusercontent.com',
    iosBundleId: 'com.example.myArt',
  );
}
