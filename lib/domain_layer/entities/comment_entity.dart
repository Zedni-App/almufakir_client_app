import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final int id;
  final int lectureID;
  final int commenterID;
  final String comment;
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
