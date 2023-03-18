import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'features/locker/data/locker_locks_repository.dart';
import 'features/locker/presentation/locker_view.dart';

void setupGetIt() {
  GetIt.I.registerSingleton<Dio>(Dio());
}

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'alilock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => LockerRepository().retrieveLocks().then(print),
        ),
        appBar: AppBar(
          title: const Text('ALILOCK'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: LockerView(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
