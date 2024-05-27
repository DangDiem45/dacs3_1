
import 'package:flutter/material.dart';

import '../../../data_provider/lecture_data.dart';
import 'lecture_item.dart';

class LectureList extends StatelessWidget {
  const LectureList({super.key});

  @override
  Widget build(BuildContext context) {
    final lectureList = LectureData.lectureList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Các Môn Học",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 400,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.85,
            ),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: lectureList.length,
            itemBuilder: (context, index) {
              final lecture = lectureList[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LectureItem(lecture: lecture),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
