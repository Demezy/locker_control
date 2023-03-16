import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LockWidget extends HookWidget {
  const LockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xfff7faf9),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xff2a6155),
              child: Icon(
                CupertinoIcons.lock_open,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Locker 1',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text('id: dsadasd'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff2a6155),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        'LOCKED',
                        style: TextStyle(color: Colors.white),
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
              value: true,
              activeColor: const Color(0xff2a6155),
              onChanged: (state) {},
            ),
          ],
        ),
      ),
    );
  }
}
