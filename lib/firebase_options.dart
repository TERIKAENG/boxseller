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
    apiKey: 'AIzaSyC-KNVSL0ODvzduU0jeVwq-bAUZRyA_WYo',
    appId: '1:49905441168:web:e7244a6d0cf496bd287b15',
    messagingSenderId: '49905441168',
    projectId: 'boxseller-2e596',
    authDomain: 'boxseller-2e596.firebaseapp.com',
    storageBucket: 'boxseller-2e596.appspot.com',
    measurementId: 'G-0PPM47S6HT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMyvpOBW1M6_IpZn_zCWFi_dfzb95DSRw',
    appId: '1:49905441168:android:97671df0161d7fba287b15',
    messagingSenderId: '49905441168',
    projectId: 'boxseller-2e596',
    storageBucket: 'boxseller-2e596.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLKJQmEpHIB8Ih9_7_WIbfuddjgz9dA8A',
    appId: '1:49905441168:ios:9eb7a672aa1b6836287b15',
    messagingSenderId: '49905441168',
    projectId: 'boxseller-2e596',
    storageBucket: 'boxseller-2e596.appspot.com',
    iosClientId: '49905441168-3rsjijemgmti38if8j8onqq6ba5ggpsc.apps.googleusercontent.com',
    iosBundleId: 'com.example.boxseller',
  );
}
