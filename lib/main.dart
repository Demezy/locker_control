import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'package:locker_control/presentation/locker_view.dart';

void setupGetIt() {
  GetIt.I.registerSingleton<Dio>(Dio());
}

void main() {
  setupGetIt();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'alilock',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xfff1f6f4),
          title: Row(
            children: const [
              Icon(
                Icons.circle_outlined,
                color: Color(0xff2e665a),
              ),
              Text(
                'ALILOCK',
                style: TextStyle(color: Color(0xff2e665a)),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: const Color(0xff2a6155),
          unselectedItemColor: Colors.blueGrey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.circle_outlined),
              label: 'My lockers',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person_2,
                weight: 20,
              ),
              label: 'my friends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Profile',
            ),
          ],
        ),
        body: Container(
          color: const Color(0xfff1f6f4),
          child: const LockerView(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
