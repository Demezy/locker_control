import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:locker_control/domain/locker_comments_model.dart';
import 'package:locker_control/domain/locker_lock_model.dart';
import 'package:locker_control/domain/locker_posts_model.dart';
import 'package:locker_control/domain/locker_profile_model.dart';

part 'locker_api_response_model.g.dart';
part 'locker_api_response_model.freezed.dart';

@freezed
class ApiResponseModel with _$ApiResponseModel {
  const factory ApiResponseModel({
    required List<ProfileModel> profile,
    required List<PostModel> posts,
    required List<CommentModel> comments,
    @JsonKey(name: 'lockers') required List<LockModel> locks,
  }) = _ApiResponseModel;

  factory ApiResponseModel.fromJson(Map<String, Object?> json) =>
      _$ApiResponseModelFromJson(json);
}
