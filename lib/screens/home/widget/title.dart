import 'package:flutter/material.dart';

import '../../../themes/font_family.dart';

class TitleItem extends StatelessWidget {
  const TitleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Column(
        children: [
          Text(
            'Chào mừng User đến với chúng tôi',
            style: TextStyle(
              fontSize: 15,
              fontFamily: FontFamily.timenewroman,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 3), // Khoảng cách giữa các dòng
          Text(
            'Bạn muốn học gì hôm nay ?',
            style: TextStyle(
              fontSize: 13,
              fontFamily: FontFamily.timenewroman,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
