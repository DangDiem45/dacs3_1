import 'lecture_category.dart';
import 'lecture_section.dart';

class Lecture {
  final String _id;
  final String _title;

  final String _thumbnailUrl;
  final List<LectureSection> _lectureSections;


  Lecture(
      this._id,
      this._title,
      this._thumbnailUrl,
      this._lectureSections,
      );

  String get thumbnailUrl => _thumbnailUrl;

  String get title => _title;

  String get id => _id;

  List<LectureSection> get sections => _lectureSections;

}
