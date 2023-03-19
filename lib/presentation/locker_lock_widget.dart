import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../config/utils/string_to_color_extension.dart';
import '../domain/locker_lock_model.dart';

class LockWidget extends HookWidget {
  final LockModel lock;
  const LockWidget({required this.lock, super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = lock.title.toColor();
    final baseColor =
        lock.isLock ? const Color(0xff2A6155) : const Color(0xffC7772E);
    return Card(
      color: const Color(0xfff7faf9),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: baseColor,
              child: Icon(
                lock.isLock ? CupertinoIcons.lock : CupertinoIcons.lock_open,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lock.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('id: ${lock.id}'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        lock.isLock ? 'LOCKED' : 'UNLOCKED',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            CupertinoSwitch(
              value: lock.isLock,
              activeColor: baseColor,
              onChanged: (state) {},
            ),
          ],
        ),
      ),
    );
  }
}
