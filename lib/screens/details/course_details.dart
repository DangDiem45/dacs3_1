import 'package:dacs3_1/screens/details/controller/course_detail_controller.dart';
import 'package:dacs3_1/screens/details/widget/favorite_option.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

import '../../common/utils/constants.dart';
import '../../constant.dart';
import '../../model/course.dart';


class CourseDetails extends ConsumerStatefulWidget {
  const CourseDetails({super.key});



  @override
  ConsumerState<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends ConsumerState<CourseDetails> {
  late Map<String, dynamic> args;
  late int courseId;

  @override
  void didChangeDependencies(){
    var args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    courseId = int.parse(args['id']);
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {
    var stateData = ref.watch(courseDetailControllerProvider(index: courseId));
    return Scaffold(
      appBar: buildAppBar(),
      body: stateData.when(
          data: (data) {
            if(data==null){
              return Center(child: Text('No course details available'));
            }
            return buildBody(
                "${AppConstants.IMAGE_UPLOADS_PATH}${data.thumbnail}",
                "${data.name}",
                "${data.lesson_num.toString()}",
                "${data.video_len.toString()}",
                "${data.follow.toString()}",
                "${data.description}",
            );
          },
          error: (error, traceStack) => Text("Error loading data"),
          loading: () => Center(
            child: CircularProgressIndicator(),
          )),
    );
  }

  AppBar buildAppBar(){
    return AppBar(
      title: Text(
        "Chi tiết",
        style: TextStyle(color: textColor),
      ),
      iconTheme: IconThemeData(color: textColor),
    );
  }

  Widget buildBody(String imagePath, String name, String lesson_num, String video_len, String follow, String description){
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(imagePath),
          ),
          SizedBox(height: 5,),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textColor),
                    ),
                    // FavoriteOption(course: widget.course),
                  ],
                ),
                Row(
                  children: [
                    getAttribute(Icons.play_circle_outline, '$lesson_num Bài giảng', Colors.grey),
                    const SizedBox(
                      width: 10,
                    ),
                    getAttribute(Icons.access_time, '${video_len}', Colors.grey),
                    const SizedBox(
                      width: 15,
                    ),
                    getAttribute(Icons.person, '${follow}', Colors.grey),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mô tả",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReadMoreText(
                      description,
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: " Show more",
                      trimExpandedText: " Show less",
                      moreStyle: const TextStyle(
                          color: kBlueColor,
                          fontWeight: FontWeight.bold
                      ),
                      lessStyle: const TextStyle(
                          color: kBlueColor,
                          fontWeight: FontWeight.bold
                      ),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey
                      ),
                    ),
                    Text(
                      "Danh sách bài giảng",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                )
              ],
          )
          // getLesson()
        ],
      ),
    );
  }
  // Widget getInfo(){
  //   return Container(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               widget.course.title,
  //               style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textColor),
  //             ),
  //             // FavoriteOption(course: widget.course),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             getAttribute(Icons.play_circle_outline, '${widget.course.lessonNo} Bài giảng', Colors.grey),
  //             const SizedBox(
  //               width: 10,
  //             ),
  //             getAttribute(Icons.access_time, widget.course.duration, Colors.grey),
  //             const SizedBox(
  //               width: 15,
  //             ),
  //             getAttribute(Icons.star, '${widget.course.rate}', Colors.yellow),
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 5,
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Mô tả",
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.w500,
  //                   color: textColor),
  //             ),
  //             SizedBox(
  //               height: 5,
  //             ),
  //             ReadMoreText(
  //               widget.course.description,
  //               trimLines: 2,
  //               trimMode: TrimMode.Line,
  //               trimCollapsedText: "Show more",
  //               trimExpandedText: "Show less",
  //               moreStyle: const TextStyle(
  //                   color: kBlueColor,
  //                   fontWeight: FontWeight.bold
  //               ),
  //               lessStyle: const TextStyle(
  //                   color: kBlueColor,
  //                   fontWeight: FontWeight.bold
  //               ),
  //               style: TextStyle(
  //                   fontSize: 14,
  //                   color: Colors.grey
  //               ),
  //             ),
  //             Text(
  //               "Danh sách bài giảng",
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w500,
  //                 color: textColor,
  //               ),
  //             ),
  //             SizedBox(
  //               height: 5,
  //             ),
  //           ],
  //         )
  //
  //       ],
  //     ),
  //   );
  // }

  // Widget getLesson() {
  //   return Column(
  //     children: List.generate(widget.course.sections.length, (index) {
  //       return Card(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         child: Container(
  //           padding: EdgeInsets.all(10),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               ClipRRect(
  //                 borderRadius: const BorderRadius.all(Radius.circular(10)),
  //                 child: Image.asset(
  //                   widget.course.thumbnailUrl,
  //                   width: 120,
  //                   height: 65,
  //                   fit: BoxFit.fill,
  //                 ),
  //               ),
  //               SizedBox(width: 10,),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(widget.course.sections[index].name),
  //                     SizedBox(height: 10,),
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.schedule_outlined,
  //                           color: Colors.grey,
  //                           size: 15,
  //                         ),
  //                         SizedBox(
  //                           width: 10,
  //                         ),
  //                         Text(
  //                           widget.course.sections[index].time,
  //                           style: TextStyle(
  //                               color: Colors.grey,
  //                               fontSize: 14
  //                           ),
  //                         ),
  //
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Icon(Icons.arrow_forward_ios_rounded)
  //             ],
  //           ),
  //         ),
  //       );
  //     }),
  //   );
  // }

  Widget getAttribute(IconData icon, String info, Color color){
    var greyTextStyle = const TextStyle(fontSize: 10, color: Colors.grey);
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: color,),
        SizedBox(
          width: 5,
        ),
        Text(info,
          style: greyTextStyle,
        )
      ],
    );
  }
}
