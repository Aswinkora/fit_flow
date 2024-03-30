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
    apiKey: 'AIzaSyA73kOvvT0Ykhi_IruThASw_sTtmbY_D2c',
    appId: '1:375141128473:web:33251b7223619403e50d88',
    messagingSenderId: '375141128473',
    projectId: 'fitflow-1d6a6',
    authDomain: 'fitflow-1d6a6.firebaseapp.com',
    storageBucket: 'fitflow-1d6a6.appspot.com',
    measurementId: 'G-W0BHSZEHSX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCA_6VgDfAP_G_N3Rpaeou9xYgQrZID4sU',
    appId: '1:375141128473:android:cb24d91921b367a8e50d88',
    messagingSenderId: '375141128473',
    projectId: 'fitflow-1d6a6',
    storageBucket: 'fitflow-1d6a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7AEAG4FYgYeLh4CSmbbj36p8Yxi_VLlk',
    appId: '1:375141128473:ios:997e211acfa845ade50d88',
    messagingSenderId: '375141128473',
    projectId: 'fitflow-1d6a6',
    storageBucket: 'fitflow-1d6a6.appspot.com',
    iosBundleId: 'com.example.fitFlow',
  );
}
