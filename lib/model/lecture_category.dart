
enum LectureCategory { all, lecture2023, lecture2022, lecture2021, lecture2020, lecture2019, lecture2018 }

extension CourseCategoryExtension on LectureCategory {
  String get title {
    // This title is used to show categories on home screen
    switch (this) {
      case LectureCategory.all:
        return "All";
      case LectureCategory.lecture2023:
        return "2023";
      case LectureCategory.lecture2022:
        return "2022";
      case LectureCategory.lecture2021:
        return "2021";
      case LectureCategory.lecture2020:
        return "2020";
      case LectureCategory.lecture2019:
        return "2019";
      case LectureCategory.lecture2018:
        return "2018";
    }
  }
}
