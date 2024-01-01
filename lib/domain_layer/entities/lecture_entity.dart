import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'lecture_entity.g.dart';

@HiveType(typeId: 2)
class LectureEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int courseID;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String thumbnail;
  @HiveField(6)
  final String video;
  @HiveField(7)
  final String duration;
  @HiveField(8)
  final bool videoFromLocal;

  const LectureEntity({
    required this.id,
    required this.courseID,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.video,
    required this.duration,
    required this.videoFromLocal,
  });

  factory LectureEntity.newOne(
      {required int courseID, required int lectureID}) {
    return LectureEntity(
      id: lectureID,
      courseID: courseID,
      title: "",
      description: "",
      thumbnail: "",
      video: "",
      duration: "",
      videoFromLocal: true,
    );
  }
  @override
  List<Object?> get props => [
        id,
        courseID,
        title,
        description,
        thumbnail,
        video,
        duration,
        videoFromLocal,
      ];

  LectureEntity copyWith({
    int? id,
    int? courseID,
    String? title,
    String? description,
    String? thumbnail,
    String? video,
    String? duration,
    bool? videoFromLocal,
  }) {
    return LectureEntity(
      id: id ?? this.id,
      courseID: courseID ?? this.courseID,
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      video: video ?? this.video,
      duration: duration ?? this.duration,
      videoFromLocal: videoFromLocal ?? this.videoFromLocal,
    );
  }
}
