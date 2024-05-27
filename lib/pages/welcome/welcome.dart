import 'package:dacs3_1/pages/welcome/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 15),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/reading.png",
                      title: "First See Learning",
                      subTitle: "Forget about the paper, now learning all in one place",
                      index: 1,context: context
                    ),
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/man.png",
                      title: "Connect With Everyone",
                      subTitle: "Always keep in touch with your tutor and friends. Let's get connected",
                      index: 2,context: context
                    ),
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/boy.png",
                      title: "Always Fascinated Learning",
                      subTitle: "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                      index: 3,context: context
                    ),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: currentPage.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}