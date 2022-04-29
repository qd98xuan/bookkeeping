import 'dart:io';

import 'package:bookkeeping/db/database_utils.dart';
import 'package:bookkeeping/myapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    DatabaseUtils databaseUtils = DatabaseUtils();
    return MaterialApp(
        title: '快来记账吧',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
          builder: (context) {
            return Container(
              color: Colors.lightBlueAccent,
              child: MaterialButton(
                child: const Text(
                  "开始记账",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () async {
                  databaseUtils.openDatabse();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (route)=>route==null
                  );
                },
              ),
            );
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    // sleep(Duration(seconds: 2000));
  }
}
