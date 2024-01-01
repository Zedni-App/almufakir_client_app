const kCommentBox = "comment box";
const kCourseBox = "course box";
const kLectureBox = "lecture box";
const kSectionBox = "section box";
const kTeacherBox = "teacher box";

Future initHive() async {
  // await Hive.initFlutter();
  // Hive.registerAdapter(CommentEntityAdapter());
  // Hive.registerAdapter(CourseEntityAdapter());
  // Hive.registerAdapter(LectureEntityAdapter());
  // Hive.registerAdapter(SectionEntityAdapter());
  // Hive.registerAdapter(TeacherEntityAdapter());
  // await Hive.openBox(kCommentBox);
  // await Hive.openBox(kCourseBox);
  // await Hive.openBox(kLectureBox);
  // await Hive.openBox(kSectionBox);
  // await Hive.openBox(kTeacherBox);
}

Future saveBooksData(dynamic data, String boxName) async {
  // await Hive.openBox<dynamic>(boxName).then((box) => box.addAll(data));
}

removeBookData(dynamic data, String boxName) async {
  // await Hive.openBox(boxName).then((box) => box.delete(data));
}
