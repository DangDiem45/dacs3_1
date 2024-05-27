import 'package:dacs3_1/common/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text24Normal({String text = "", Color color = AppColors.primaryText}){
  return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.normal
  ),
  );
}

Widget text16Normal({String text = "", Color color = AppColors.primarySecondElementText}){
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color,
        fontSize: 15,
        fontWeight: FontWeight.normal
    ),
  );
}

Widget text14Normal({String text = "", Color color = AppColors.primaryThreeElementText}){
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
        color: color,
        fontSize: 15,
        fontWeight: FontWeight.normal
    ),
  );
}

Widget textUnderline({String text ="Your text"}){
  return GestureDetector(
    onTap: (){

    },
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: AppColors.primaryText,
        fontSize: 12,
        decorationColor: AppColors.primaryText,
        decoration: TextDecoration.underline
      ),
    ),
  );
}


