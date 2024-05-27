import 'package:dacs3_1/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

AppBar buildAppbar({String title=""}){
  return AppBar(
    automaticallyImplyLeading: false,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),

    ),
    title: Center(
      child: text16Normal(
          text: title,
          color: AppColors.primaryText
      ),
    ),
  );
}