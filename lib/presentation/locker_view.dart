import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/locker_locks_provider.dart';
import '../domain/locker_lock_model.dart';
import 'locker_lock_widget.dart';

class LockerView extends ConsumerWidget {
  const LockerView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locksState = ref.watch(lockerStateProvider);
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My lockers',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.logout,
                    color: Color(0xff2e665a),
                  ),
                ),
              ],
            ),
            locksState.when(
              error: (Object error, StackTrace stackTrace) {
                return const Text('Something went wrong :(');
              },
              loading: () {
                return const CircularProgressIndicator();
              },
              data: (List<LockModel> locks) {
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
                                padding: const EdgeInsets.all(20),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(14),
                                  ),
                                ),
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
      ),
    );
  }
}
