import 'package:flutter/material.dart';
import 'package:session7test/Components/user_item.dart';
import 'package:session7test/utils/data/models/user.dart';
import 'package:video_player/video_player.dart';

class VideoCourse extends StatefulWidget {
  final String _videoPath;

  const VideoCourse({required String videoPath}) : _videoPath = videoPath;

  @override
  _VideoCourseState createState() => _VideoCourseState();
}

class _VideoCourseState extends State<VideoCourse> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  void loadVideoPlayer() {
    controller = VideoPlayerController.asset(widget._videoPath);
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<User> users = [
    User(firstName: "Lesson 1", phoneNumber: "30min", id: '', lastName: '', email: ''),
    User(firstName: "Lesson 2", phoneNumber: "25min", id: '', lastName: '', email: ''),
    User(firstName: "Lesson 3", phoneNumber: "28min", id: '', lastName: '', email: ''),
    User(firstName: "Lesson 4", phoneNumber: "40min", id: '', lastName: '', email: ''),
    User(firstName: "Lesson 5", phoneNumber: "33min", id: '', lastName: '', email: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Customize the app bar color
      ),
      backgroundColor: Colors.grey[200], // Customize the background color
      body: Column(
        children: [
          AnimatedOpacity(
            opacity: controller.value.isInitialized ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0), // Add border radius
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            "Introduction: ${formatDuration(controller.value.duration)}",
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 20.0),
          VideoProgressIndicator(
            controller,
            allowScrubbing: true,
            colors: const VideoProgressColors(
              backgroundColor: Colors.white,
              playedColor: Color(0xff385f98),
              bufferedColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.skip_previous_outlined),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                  setState(() {});
                },
                icon: Icon(
                  controller.value.isPlaying
                      ? Icons.pause_circle
                      : Icons.play_circle_fill,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.seekTo(const Duration(seconds: 1));
                  setState(() {});
                },
                icon: const Icon(Icons.refresh),
              ),
              const SizedBox(
                width: 30,
              ),
              const Icon(Icons.skip_next_outlined),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: UserItem(userModel: users[index]),
                );
              },
              itemCount: users.length,
              separatorBuilder: (context, index) =>
                  const Divider(indent: 20, endIndent: 20),
            ),
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) {
        return "$n";
      } else {
        return "0$n";
      }
    }

    final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${duration.inHours}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
