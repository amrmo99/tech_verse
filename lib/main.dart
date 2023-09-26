import 'package:flutter/material.dart';
import 'package:session7test/Components/UserItem.dart';
import 'package:session7test/Models/UserModel.dart';
import 'package:session7test/Screens/ProfilPage.dart';
import 'package:session7test/Screens/ShopScreen.dart';
import 'package:session7test/Screens/SplashScreen.dart';
import 'package:session7test/Screens/home_screen.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class VideoCourse extends StatefulWidget {
  final String videoPath;

  VideoCourse({required this.videoPath});

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

  loadVideoPlayer() {
    controller = VideoPlayerController.asset(widget.videoPath);
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

  List<UserModel> users = [
    UserModel(name: "Lesson 1", phone: "30min"),
    UserModel(name: "Lesson 2", phone: "25min"),
    UserModel(name: "Lesson 3", phone: "28min"),
    UserModel(name: "Lesson 4", phone: "40mn"),
    UserModel(name: "Lesson 5", phone: "33min"),
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
            duration: Duration(milliseconds: 500),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0), // Add border radius
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            "Introduction: ${formatDuration(controller.value.duration)}",
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          VideoProgressIndicator(
            controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              backgroundColor: Colors.white,
              playedColor: Color(0xff385f98),
              bufferedColor: Colors.grey,
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.skip_previous_outlined),
                SizedBox(
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
                    controller.seekTo(Duration(seconds: 0));
                    setState(() {});
                  },
                  icon: Icon(Icons.refresh),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.skip_next_outlined)
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  var currenUser = users[index];
                  return GestureDetector(
                    onTap: () {},
                    child: UserItem(userModel: users[index]),
                  );
                },
                itemCount: users.length,
                separatorBuilder: (context, index) =>
                    Divider(indent: 20, endIndent: 20),
              ),
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

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${duration.inHours}:${twoDigitMinutes}:${twoDigitSeconds}";
  }
}
