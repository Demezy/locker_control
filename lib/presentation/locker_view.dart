import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/locker_locks_repository.dart';
import '../domain/locker_lock_model.dart';
import 'locker_lock_widget.dart';

class LockerView extends StatefulWidget {
  LockerView({super.key, required this.title});
  // TODO: create provider for repository
  final lockerRepository = LockerRepository();

  final String title;

  @override
  State<LockerView> createState() => _LockerViewState();
}

class _LockerViewState extends State<LockerView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // TODO: replace FutureBuilder with riverpod FutureProvider
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('My lockers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          FutureBuilder<List<LockModel>>(
            future: widget.lockerRepository.retrieveLocks(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final locks = snapshot.data!;
              return Expanded(
                child: ListView.separated(
                  itemCount: locks.length + 1,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) => locks.length > index
                      ? LockWidget(lock: locks[index])
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            // TODO: move color to colorscheme
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff2a6155),
                            ),
                            onPressed: () {},
                            child: const Text('+ Add locker'),
                          ),
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
