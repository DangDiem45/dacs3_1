
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../data_provider/course_data_provider.dart';
import '../../model/course.dart';
import '../../model/course_category.dart';
import '../../model/my_course.dart';

class MyCourseList extends StatelessWidget {
  MyCourseList({super.key});

  // List<MyCourse> myCourseList = MyCourseDataProvider.myCourses;

  List<Course> featuredCourseList = [
    CourseDataProvider.courseList[0],
    CourseDataProvider.courseList[1],
    CourseDataProvider.courseList[2],
    CourseDataProvider.courseList[3],
    CourseDataProvider.courseList[4],
  ];

  @override
  Widget build(BuildContext context) {
    if(featuredCourseList.isNotEmpty){
      featuredCourseList[0].progress = 50;
      featuredCourseList[1].progress = 20;
      featuredCourseList[2].progress = 60;
      featuredCourseList[3].progress = 70;
      featuredCourseList[4].progress = 25;
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: appBgColor,
            pinned: true,
            title: getAppBar(),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 10, left: 10),
            sliver: SliverToBoxAdapter(
              child: getCategories(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 3),
            sliver: SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: featuredCourseList.length,
                itemBuilder: (context, index) {
                  Course course = featuredCourseList[index];
                  return getMyCourse(course, context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getMyCourse(Course course, BuildContext context){
    return Card(
      child: ListTile(
        leading: Image.asset(course.thumbnailUrl),
        title: Text(
          course.title,
          maxLines: 2,
          style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.createdBy,
              style: TextStyle(color: Colors.grey.shade500),
            ),
            const SizedBox(height: 10,),
            Visibility(
                visible: course.progress > 0,
                replacement: const Text(
                    "Start Course",
                    style: TextStyle(color: kBlueColor, fontWeight: FontWeight.bold
                    )),
                child: Row(
                  children: [
                    Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              trackHeight: 3,
                              thumbColor: Colors.transparent,
                              overlayShape: SliderComponentShape.noThumb,
                              thumbShape: SliderComponentShape.noThumb
                          ),
                          child: Slider(
                            min: 0,
                            max: 100,
                            value: course.progress.toDouble(),
                            onChanged: (val) {

                            },
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("${course.progress}%")
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  Widget getAppBar() {
    return Center(
      child: Container(
        child: Row(
          children: [
            Text(
              "Khóa học của tôi",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCategories() {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CourseCategory.values.length,
        itemBuilder: (context, index) {
          CourseCategory courseCategory = CourseCategory.values[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  courseCategory.title,
                  style: const TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}