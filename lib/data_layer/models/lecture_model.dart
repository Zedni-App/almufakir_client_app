import '../../domain_layer/entities/lecture_entity.dart';

class LectureModel extends LectureEntity {
  const LectureModel({
    required super.id,
    required super.courseID,
    required super.title,
    required super.videoFromLocal,
    required super.description,
    required super.thumbnail,
    required super.video,
    required super.duration,
  });
  Map<String, dynamic> toMap() {
    return {
      'lecture_id': id,
      'course_id': courseID,
      'title': title,
      'description': description,
      'duration': duration,
    };
  }

  factory LectureModel.fromMap(Map<String, dynamic> map){
    return LectureModel(
      id: int.parse(map['id']),
      courseID: int.parse(map['course_id']),
      title: map['title'],
      description: map['description'],
      video: map['video']??"",
      thumbnail: map['thumbnail']??"",
      duration: map['duration']??"",
      videoFromLocal: false,
    );
  }

  factory LectureModel.fromEntity(LectureEntity lecture) {
    return LectureModel(
      id: lecture.id,
      courseID: lecture.courseID,
      title: lecture.title,
      description: lecture.description,
      video: lecture.video,
      thumbnail: lecture.thumbnail,
      duration: lecture.duration,
      videoFromLocal: lecture.videoFromLocal,
    );
  }
}
