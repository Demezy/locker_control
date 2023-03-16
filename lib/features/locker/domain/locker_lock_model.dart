import 'package:freezed_annotation/freezed_annotation.dart';

part 'locker_lock_model.g.dart';
part 'locker_lock_model.freezed.dart';

@freezed
class LockModel with _$LockModel {
  const factory LockModel({
    required int id,
    required String code,
    required String title,
    required bool isLock,
  }) = _LockModel;

  factory LockModel.fromJson(Map<String, Object?> json) =>
      _$LockModelFromJson(json);
}
