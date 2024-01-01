import 'package:equatable/equatable.dart';

class FeedbackEntity extends Equatable {
  final int id;
  final int courseID;
  final int commenterID;
  final int rate;
  final String feedback;
  final String date;

  const FeedbackEntity({
    required this.id,
    required this.courseID,
    required this.commenterID,
    required this.rate,
    required this.feedback,
    required this.date,
  });

  @override
  List<Object> get props => [
        id,
        courseID,
        commenterID,
        rate,
        feedback,
        date,
      ];
}
