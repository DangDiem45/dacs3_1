import 'package:dacs3_1/common/global_loader/global_loader.dart';
import 'package:dacs3_1/common/utils/app_colors.dart';
import 'package:dacs3_1/common/widgets/button_widgets.dart';
import 'package:dacs3_1/common/widgets/text_widgets.dart';
import 'package:dacs3_1/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:dacs3_1/pages/sign_up/notifier/register_notifier.dart';
import 'package:dacs3_1/pages/sign_up/sign_up_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});


  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {

  late SignUpController _controller;

  void initState(){
    _controller = SignUpController(ref: ref);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: "Sign Up"),
          backgroundColor: Colors.white,
          body: loader==false?SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15,),
                Center(child: text14Normal(text: "Enter your details below & free sign up")),
                SizedBox(height: 30,),
                appTextField(
                    text: "User name",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your username",
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserNameChange(value),

                ),
                SizedBox(height: 15,),
                appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your email",
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onUserEmailChange(value),
                ),
                SizedBox(height: 15,),
                appTextField(
                    text: "Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Enter your password",
                    obscureText: true,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onPasswordChange(value),
                ),
                SizedBox(height: 15,),
                appTextField(
                    text: "Confirm Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Enter your Confirm Password",
                    obscureText: true,
                    func: (value)=>ref.read(registerNotifierProvider.notifier).onRePasswordChange(value),
                ),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: text14Normal(text: "By creating an account you have to agree with our them & condication")
                  ),
                SizedBox(height: 40,),
                Center(
                    child: appButton(
                      buttonName: "Sign up",
                        isLogin: true,
                        context: context,
                      func: ()=> _controller.handleSignUp()
                    )
                ),
              ],
            ),
          )
              :const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  color: AppColors.primaryElement,
                ),
          )
        ),
      ),
    );
  }
}
