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
    apiKey: 'AIzaSyCuSiHvc1osXFiSZu2_S1iSATWv_5Xffzs',
    appId: '1:969732909074:web:da9861145ecad16cce90cb',
    messagingSenderId: '969732909074',
    projectId: 'coa-bb86b',
    authDomain: 'coa-bb86b.firebaseapp.com',
    storageBucket: 'coa-bb86b.appspot.com',
    measurementId: 'G-8G2RWYL4NN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0-kzgm4H1--40FWfZCGtdJutmAXoFi8s',
    appId: '1:969732909074:android:259c949524bf0989ce90cb',
    messagingSenderId: '969732909074',
    projectId: 'coa-bb86b',
    storageBucket: 'coa-bb86b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4wZPdf8OsCZwr9R8XIdM1aya9LzU1PpI',
    appId: '1:969732909074:ios:82ea4fc61136b4fbce90cb',
    messagingSenderId: '969732909074',
    projectId: 'coa-bb86b',
    storageBucket: 'coa-bb86b.appspot.com',
    iosClientId: '969732909074-doh8oid0duliugklv1rnku48rprdornf.apps.googleusercontent.com',
    iosBundleId: 'com.example.companyTasksOrganizer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4wZPdf8OsCZwr9R8XIdM1aya9LzU1PpI',
    appId: '1:969732909074:ios:82ea4fc61136b4fbce90cb',
    messagingSenderId: '969732909074',
    projectId: 'coa-bb86b',
    storageBucket: 'coa-bb86b.appspot.com',
    iosClientId: '969732909074-doh8oid0duliugklv1rnku48rprdornf.apps.googleusercontent.com',
    iosBundleId: 'com.example.companyTasksOrganizer',
  );
}
