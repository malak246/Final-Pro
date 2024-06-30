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
    apiKey: 'AIzaSyCQLmeiUgYSrgIHg1O5rM_ebYHuTB-FtSw',
    appId: '1:56520686251:web:9010523825f457c40a15ee',
    messagingSenderId: '56520686251',
    projectId: 'smart-parking-65c12',
    authDomain: 'smart-parking-65c12.firebaseapp.com',
    databaseURL: 'https://smart-parking-65c12-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-parking-65c12.appspot.com',
    measurementId: 'G-PY3MT44KHC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCx6o6fIJU0u6FYSy0VBYWe_fUDCGdSQ_4',
    appId: '1:56520686251:android:ba80d1dd9e58a3a70a15ee',
    messagingSenderId: '56520686251',
    projectId: 'smart-parking-65c12',
    databaseURL: 'https://smart-parking-65c12-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-parking-65c12.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDP4JHaAxpvIp97j7xWIofUK13uMX5fLQg',
    appId: '1:56520686251:ios:469240f181bf86000a15ee',
    messagingSenderId: '56520686251',
    projectId: 'smart-parking-65c12',
    databaseURL: 'https://smart-parking-65c12-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-parking-65c12.appspot.com',
    iosBundleId: 'com.example.modernlogintute',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDP4JHaAxpvIp97j7xWIofUK13uMX5fLQg',
    appId: '1:56520686251:ios:469240f181bf86000a15ee',
    messagingSenderId: '56520686251',
    projectId: 'smart-parking-65c12',
    databaseURL: 'https://smart-parking-65c12-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-parking-65c12.appspot.com',
    iosBundleId: 'com.example.modernlogintute',
  );
}
