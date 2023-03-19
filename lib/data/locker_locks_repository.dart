import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:locker_control/domain/locker_api_response_model.dart';
import 'package:locker_control/domain/locker_lock_model.dart';

typedef Locks = List<LockModel>;

class LockerRepository {
  LockerRepository() {
    retrieveLocks();
  }

  final _dio = GetIt.I.get<Dio>();
  // TODO: move to Hive
  Locks _locksState = [];
  final _lockerController = StreamController<Locks>();

  void dispose() {
    _lockerController.close();
  }

  Stream<Locks> get stream => _lockerController.stream;

  Future<Locks> retrieveLocks() async {
    late final Locks locks;
    // TODO: move url to config
    const apiUrl = 'https://my-json-server.typicode.com/ozon671game/demo/db';
    try {
      final response = await _dio.get<Map<String, Object?>>(apiUrl);
      if (response.data == null) {
        throw UnimplementedError('Add some logic to handle void api response');
      }
      locks = ApiResponseModel.fromJson(response.data!).locks;
    } on DioError {
      // TODO: add some logic here
      throw UnimplementedError('Api server exception unhandled');
    }
    _locksState = locks.toList();
    _lockerController.add(_locksState);
    return _locksState;
  }

  Future<void> toggleLockStateById({
    required int lockId,
    required bool state,
  }) async {
    final lockIndex = _locksState.indexWhere((lock) => lock.id == lockId);
    _locksState[lockIndex] = _locksState[lockIndex].copyWith(isLock: state);
    _lockerController.add(_locksState);
  }

  Future<void> uploadLocks(Locks locks) async {
    throw UnimplementedError('Data uploading is not implemented');
  }
}
