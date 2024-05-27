import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../arguments/course_arguments.dart';
import '../../../common/utils/route_names.dart';
import '../../../constant.dart';
import '../../../model/course.dart';

class CourseItem1 extends StatelessWidget {
  const CourseItem1({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(
                  context,
                  RouteNames.courseDetails,
                  arguments: CourseArgument(course)
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(course.thumbnailUrl),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person,
                            color: kBlueColor, size: 15,),
                          const SizedBox(width: 3),
                          Text(
                            course.createdBy,
                            style: const TextStyle(fontSize: 8, color: kBlueColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 15,
                                color: kRatingColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${course.rate}',
                                style: const TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Text(
                            "${course.price} VND",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
