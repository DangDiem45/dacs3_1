import 'package:dacs3_1/common/utils/constants.dart';
import 'package:dacs3_1/screens/lesson_details/controller/lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Import thư viện YouTube Player

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  _LessonDetailState createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late Map<String, dynamic> args;
  late int courseId;
  late YoutubePlayerController _controller;
  bool isPlaying = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    courseId = int.parse(args['id']);
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '', // Khởi tạo với video ID trống
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller.addListener(() {
      if (_controller.value.playerState == PlayerState.playing) {
        setState(() {
          isPlaying = true;
        });
      } else {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lessonDetail = ref.watch(lessonDetailControllerProvider(index: courseId));
    var lessonData = ref.watch(lessonDataControllerProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            lessonData.when(
              data: (data) {
                if (data.lessonItem.isEmpty ||
                    data.lessonItem[0].videos == null ||
                    data.lessonItem[0].videos!.isEmpty) {
                  return Text("No lesson available");
                }
                print("Video URL: ${data.url}");

                String videoId = YoutubePlayer.convertUrlToId(data.url ?? '') ?? '';
                _controller = YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                  ),
                );

                return Column(
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Image(
                              image: AssetImage("assets/icons/rewind-left.png"),
                              width: 24,
                              height: 24,
                            ),
                          ),
                          SizedBox(width: 20,),
                          GestureDetector(
                            onTap: (){
                              // Tạm dừng hoặc phát video khi người dùng nhấn vào nút
                              if (isPlaying) {
                                _controller.pause();
                              } else {
                                _controller.play();
                              }
                            },
                            child: Image(
                              image: AssetImage(isPlaying ? "assets/icons/pause.png" : "assets/icons/play-circle.png"),
                              width: 24,
                              height: 24,
                            ),
                          ),
                          SizedBox(width: 20,),
                          GestureDetector(
                            child: Image(
                              image: AssetImage("assets/icons/rewind-right.png"),
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              error: (e, t) => Text("Error: $e"),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}


