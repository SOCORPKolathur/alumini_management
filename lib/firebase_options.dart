// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCEUUrMt8TdqLwvMVg1f46WESoVs6Ekrlc',
    appId: '1:213580418152:web:0967c20675e501a7ffffdd',
    messagingSenderId: '213580418152',
    projectId: 'alumni-management-b7491',
    authDomain: 'alumni-management-b7491.firebaseapp.com',
    storageBucket: 'alumni-management-b7491.appspot.com',
    measurementId: 'G-KHY970GPC3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOik2KsGFCdI505Eu0mq7hlxwVaBAiTQk',
    appId: '1:213580418152:android:c8cd84e75629ba8affffdd',
    messagingSenderId: '213580418152',
    projectId: 'alumni-management-b7491',
    storageBucket: 'alumni-management-b7491.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjMisr_1RElzNCDRs9nYjaYiCbBq8sWGs',
    appId: '1:213580418152:ios:98e4a0424b0da95fffffdd',
    messagingSenderId: '213580418152',
    projectId: 'alumni-management-b7491',
    storageBucket: 'alumni-management-b7491.appspot.com',
    iosBundleId: 'com.example.aluminiManagement',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjMisr_1RElzNCDRs9nYjaYiCbBq8sWGs',
    appId: '1:213580418152:ios:98e4a0424b0da95fffffdd',
    messagingSenderId: '213580418152',
    projectId: 'alumni-management-b7491',
    storageBucket: 'alumni-management-b7491.appspot.com',
    iosBundleId: 'com.example.aluminiManagement',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCEUUrMt8TdqLwvMVg1f46WESoVs6Ekrlc',
    appId: '1:213580418152:web:c549f15fd27fae4cffffdd',
    messagingSenderId: '213580418152',
    projectId: 'alumni-management-b7491',
    authDomain: 'alumni-management-b7491.firebaseapp.com',
    storageBucket: 'alumni-management-b7491.appspot.com',
    measurementId: 'G-PZVW7FR0W4',
  );

}