import 'package:freezed_annotation/freezed_annotation.dart';

part 'locker_comments_model.g.dart';
part 'locker_comments_model.freezed.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required int userId,
    required int id,
    required String text,
    required int postId,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, Object?> json) =>
      _$CommentModelFromJson(json);
}
