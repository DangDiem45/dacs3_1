enum CourseCategory { all, programming, finance, marketing, other }

extension CourseCategoryExtension on CourseCategory {
  String get title {
    // This title is used to show categories on home screen
    switch (this) {
      case CourseCategory.all:
        return "Tất cả";
      case CourseCategory.programming:
        return "Toán";
      case CourseCategory.finance:
        return "Vật lý";
      case CourseCategory.marketing:
        return "Hóa học";
      case CourseCategory.other:
        return "Anh Văn";
    }
  }
}
