import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:locker_control/data/locker_locks_repository.dart';

final lockerRepositoryProvider =
    StateProvider<LockerRepository>((ref) => LockerRepository());
final lockerStateProvider = StreamProvider.autoDispose<Locks>((ref) {
  final lockerRepository = ref.watch(lockerRepositoryProvider);
  return lockerRepository.stream;
});
