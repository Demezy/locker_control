import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../domain/locker_api_response_model.dart';
import '../domain/locker_lock_model.dart';

typedef Locks = List<LockModel>;

class LockerRepository {
  final _dio = GetIt.I.get<Dio>();

  Future<Locks> retrieveLocks() async {
    late final Locks locks;
    // TODO: move url to config
    const apiUrl = 'https://my-json-server.typicode.com/ozon671game/demo/db';
    try {
      final response = await _dio.get(apiUrl);
      locks = ApiResponseModel.fromJson(response.data).locks;
    } on DioError catch (e) {
      // TODO: add some logic here 
      throw UnimplementedError('Api server exception unhandled');
    }
    return locks;
  }
}
