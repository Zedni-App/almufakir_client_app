import '../../domain_layer/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  const CommentModel({
    required super.id,
    required super.lectureID,
    required super.commenterID,
    required super.comment,
    required super.date,
  });

  Map<String, dynamic> toMap() {
    return {
      "id":id,
      "lecture_id":lectureID,
      "commenter_id":commenterID,
      "comment":comment,
      "date":date,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id:int.parse(map["id"]),
      lectureID:int.parse(map["lecture_id"]),
      commenterID:int.parse(map["commenter_id"]),
      comment:map["comment"],
      date:map["date"],
    );
  }
}
