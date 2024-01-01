import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'comment_entity.g.dart';

@HiveType(typeId:0)
class CommentEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int lectureID;
  @HiveField(2)
  final int commenterID;
  @HiveField(3)
  final String comment;
  @HiveField(4)
  final String date;

  const CommentEntity({
    required this.id,
    required this.lectureID,
    required this.commenterID,
    required this.comment,
    required this.date,
  });

  @override
  List<Object> get props => [
        id,
        lectureID,
        commenterID,
        comment,
        date,
      ];
}
