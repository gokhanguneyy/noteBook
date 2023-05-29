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
    apiKey: 'AIzaSyAVKpUXFnwui_yiQ6QIQ_FAu1fVMCMMvdc',
    appId: '1:839507626739:web:b3c811b3c81e91fdd04586',
    messagingSenderId: '839507626739',
    projectId: 'notebook-e5c9f',
    authDomain: 'notebook-e5c9f.firebaseapp.com',
    storageBucket: 'notebook-e5c9f.appspot.com',
    measurementId: 'G-HQE37XYZLN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3fYIWKb_FonZid30X30vpg70SW9590L0',
    appId: '1:839507626739:android:27483daa708d1e2cd04586',
    messagingSenderId: '839507626739',
    projectId: 'notebook-e5c9f',
    storageBucket: 'notebook-e5c9f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0B_AIkPq1779oZBbHM06tnhnkazZiQGA',
    appId: '1:839507626739:ios:570d3405dd1a49aad04586',
    messagingSenderId: '839507626739',
    projectId: 'notebook-e5c9f',
    storageBucket: 'notebook-e5c9f.appspot.com',
    iosClientId: '839507626739-aenl66jo400nmhcd0n9l7a42m01v5qqt.apps.googleusercontent.com',
    iosBundleId: 'com.example.notebook',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0B_AIkPq1779oZBbHM06tnhnkazZiQGA',
    appId: '1:839507626739:ios:570d3405dd1a49aad04586',
    messagingSenderId: '839507626739',
    projectId: 'notebook-e5c9f',
    storageBucket: 'notebook-e5c9f.appspot.com',
    iosClientId: '839507626739-aenl66jo400nmhcd0n9l7a42m01v5qqt.apps.googleusercontent.com',
    iosBundleId: 'com.example.notebook',
  );
}