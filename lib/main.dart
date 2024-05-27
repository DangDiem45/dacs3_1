import 'package:dacs3_1/common/services/http_util.dart';
import 'package:dacs3_1/common/utils/app_styles.dart';
import 'package:dacs3_1/firebase_options.dart';
import 'package:dacs3_1/global.dart';
import 'package:dacs3_1/pages/sign_in/sign_in.dart';
import 'package:dacs3_1/pages/sign_up/sign_up.dart';
import 'package:dacs3_1/pages/welcome/welcome.dart';
import 'package:dacs3_1/screens/details/course_details.dart';
import 'package:dacs3_1/screens/details/lecture_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'arguments/course_arguments.dart';
import 'arguments/lecture_arguments.dart';
import 'common/utils/route_names.dart';

Future<void> main() async {
  await Global.init();

  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, chlid) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appThemeData,
        initialRoute: "/",
        routes: {
          "/":(context)=>Welcome(),
          // "signIn":(context)=> const SignIn(),
          "/register":(context)=> const SignUp(),
        },
        onGenerateRoute: (settings){
          // if(settings.name == RouteNames.courseDetails){
          //   final args = settings.arguments as CourseArgument;
          //   return MaterialPageRoute(builder: (context) => CourseDetails(course: args.course));
          // }
          if(settings.name == RouteNames.lectureDetails){
            final args = settings.arguments as LectureArgument;
            return MaterialPageRoute(builder: (context) => LectureDetail(lecture: args.lecture,));
          }
        },
        // home: Welcome(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}
