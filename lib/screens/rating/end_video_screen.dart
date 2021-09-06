import 'package:feedback/screens/welcome_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';



class VideoApp extends StatefulWidget {
  static String id = 'end_video';
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/logo_animation.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Column(
          children: [
            FittedBox(
              // If your background video doesn't look right, try changing the BoxFit property.
              // BoxFit.fill created the look I was going for.
              fit: BoxFit.cover,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                child: VideoPlayer(_controller),

              ),
            ),

            ElevatedButton(onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, WelcomeScreen.id, ModalRoute.withName('/'));
            }, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Home', style: TextStyle(fontSize: 18)),
            )),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text('Thanks for your valuable feedback', style: TextStyle(fontSize: 18, color: Colors.amber),),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}