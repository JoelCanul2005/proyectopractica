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
    apiKey: 'AIzaSyCMU8nMcMpkCbfyUPQUnIUuOgksCTeGr_w',
    appId: '1:506762680822:web:8caf199d8618c90549cfd7',
    messagingSenderId: '506762680822',
    projectId: 'proyectoestadias-6e9b5',
    authDomain: 'proyectoestadias-6e9b5.firebaseapp.com',
    storageBucket: 'proyectoestadias-6e9b5.firebasestorage.app',
    measurementId: 'G-CP9RLXZ437',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsG01AIt0-2SE54TE689GdjpkwVCbD864',
    appId: '1:506762680822:android:a96e23feec50cf9849cfd7',
    messagingSenderId: '506762680822',
    projectId: 'proyectoestadias-6e9b5',
    storageBucket: 'proyectoestadias-6e9b5.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpq7yIc9dFpScJzogM_bg9r_6eQL47lvE',
    appId: '1:506762680822:ios:e921cd0f3b518cd649cfd7',
    messagingSenderId: '506762680822',
    projectId: 'proyectoestadias-6e9b5',
    storageBucket: 'proyectoestadias-6e9b5.firebasestorage.app',
    iosBundleId: 'com.joelcanul.proyectopractica',
  );
}
