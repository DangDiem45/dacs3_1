import 'package:dacs3_1/common/utils/app_colors.dart';
import 'package:dacs3_1/common/widgets/app_shadow.dart';
import 'package:dacs3_1/common/widgets/image_widgets.dart';
import 'package:dacs3_1/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';


Widget thirdPartyLogin(){
  return Container(
    margin: EdgeInsets.only(left: 80, right: 80, top: 40, bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png")
      ],
    ),
  );
}

Widget _loginButton(String imagePath){
  return GestureDetector(
    onTap: (){

    },
    child: SizedBox(
      width: 40,
        height: 40,
        child: Image.asset(imagePath)
    ),
  );
}
