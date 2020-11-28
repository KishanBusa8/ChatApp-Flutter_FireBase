import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class FireBaseGlobals{

  FirebaseApp app;
  FirebaseStorage storage;
  List<String> actionedMessageIds=[];
  StreamController<int> changeUnreadAlertsController = StreamController<int>.broadcast();

  static final FireBaseGlobals _singleton = new FireBaseGlobals._internal();

  factory FireBaseGlobals(){
    return _singleton;
  }

  FireBaseGlobals._internal(){
    print('In golabls _internal');

    Future<FirebaseApp> firebaseAppFuture=Firebase.initializeApp(
      name: 'ChatApp',
      options: FirebaseOptions(
        appId: Platform.isIOS
            ? '1:665648663939:ios:225ffc1f17e8d466d6bab6'
            : '1:665648663939:android:225ffc1f17e8d466d6bab6',
        messagingSenderId: '665648663939',
        apiKey: 'AIzaSyC8-5R6Yy0ML0pWGvt4XjvsoIgN5eDx4-4',
        projectId: 'chatdemo-ea88b',
      ),
    );

    firebaseAppFuture.then((FirebaseApp tempApp){
      app=tempApp;

      storage = FirebaseStorage(
          app: app,
          storageBucket: 'gs://chatdemo-ea88b.appspot.com'
      );

    }).catchError((error,stacktrace){
      print('Error initializing FireBaseApp');
      print(error.toString());
      print(stacktrace.toString());
    });

  }


}
