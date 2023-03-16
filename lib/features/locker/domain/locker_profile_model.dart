import 'package:freezed_annotation/freezed_annotation.dart';

part 'locker_profile_model.g.dart';
part 'locker_profile_model.freezed.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String username,
    required String name,
    required int id,
    required String phone,
    required String email,
    required String website,
    @JsonKey(name: 'adress') required String address, // error in api? "address"
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) =>
      _$ProfileModelFromJson(json);
}
