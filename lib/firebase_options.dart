// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
    apiKey: 'AIzaSyCnrSUAF53nspYhNc7umeScRWhqVqASZZU',
    appId: '1:838050117217:web:fdc64cfa8d852763119c20',
    messagingSenderId: '838050117217',
    projectId: 'tech-verse-319',
    authDomain: 'tech-verse-319.firebaseapp.com',
    storageBucket: 'tech-verse-319.appspot.com',
    measurementId: 'G-GM20JBGMQZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDWylEXjNIoFzW0BhLO_QtJhA-v7vc1QM',
    appId: '1:838050117217:android:4de2b264e609fb3e119c20',
    messagingSenderId: '838050117217',
    projectId: 'tech-verse-319',
    storageBucket: 'tech-verse-319.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZnoZ1Oy9m0_v1LZ6YV0A1qoCmV7XvYiQ',
    appId: '1:838050117217:ios:eda920997819500f119c20',
    messagingSenderId: '838050117217',
    projectId: 'tech-verse-319',
    storageBucket: 'tech-verse-319.appspot.com',
    iosBundleId: 'com.example.session7test',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZnoZ1Oy9m0_v1LZ6YV0A1qoCmV7XvYiQ',
    appId: '1:838050117217:ios:1356131a345df7d3119c20',
    messagingSenderId: '838050117217',
    projectId: 'tech-verse-319',
    storageBucket: 'tech-verse-319.appspot.com',
    iosBundleId: 'com.example.session7test.RunnerTests',
  );
}
