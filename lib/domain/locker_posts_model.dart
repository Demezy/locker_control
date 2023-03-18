import 'package:freezed_annotation/freezed_annotation.dart';

part 'locker_posts_model.g.dart';
part 'locker_posts_model.freezed.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required int id,
    required int userId,
    required String title,
    required String description,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, Object?> json) =>
      _$PostModelFromJson(json);
}
