
import 'lecture_category.dart';

class LectureSection {
  final String _title;
  final String _description;
  final String _duration;
  final String _question;
  final LectureCategory _lectureCategory;

  // final List<Lecture> _lectures;

  LectureSection(this._title, this._description, this._duration, this._question, this._lectureCategory,);

  // List<Lecture> get lectures => _lectures;

  String get title => _title;
  String get description => _description;
  String get duration => _duration;
  String get question => _question;
  LectureCategory get lectureCategory => _lectureCategory;

}
