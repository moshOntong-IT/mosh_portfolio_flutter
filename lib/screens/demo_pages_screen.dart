import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosh_portfolio_flutter/provider/scroll_offset.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DemoPagesScreen extends StatefulWidget {
  const DemoPagesScreen({Key? key}) : super(key: key);

  @override
  _DemoPagesScreenState createState() => _DemoPagesScreenState();
}

class _DemoPagesScreenState extends State<DemoPagesScreen> {
  VideoPlayerController? _controller;
  ScrollController? _scrollController;

  @override
  void dispose() {
    // _scrollController?.dispose();
    _scrollController?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = PageController()
      ..addListener(() {
        var provider =
            Provider.of<ScrollOffsetNotifier>(context, listen: false);
        provider.setOffSet(_scrollController!.offset);
      });

    _controller = VideoPlayerController.network(
        'https://moshontong-it.github.io/mosh_portfolio_flutter/assets/videos/video.mp4')
      ..addListener(() => setState(() {
            videoPosition = _controller!.value.position;
          }))
      ..initialize().then((_) => setState(() {
            videoLength = _controller!.value.duration;
          }));
  }

  Duration? videoLength;
  Duration? videoPosition;
  double volume = 0.5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200.0),
      child: ListView(
        controller: _scrollController,
        children: <Widget>[
          const Text(
            'Davao Gulf',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 80,
                fontFamily: 'Montserrat'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            """The “Davao Gulf” ensures that customers can find everything needed in one place, without
a necessity to even get up from the couch. With “Davao Gulf”, your needs are just one-click
away. It will also ensure that consumers are safe and not fooled,""",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Needs',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                fontFamily: 'Montserrat'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            """Nowadays, local business owners, including small businesses, have been having difficulties
searching for local suppliers since the pandemic arrived. Limited supplies are catered to every
store, and most of them do not have contact with a specific supplier that can sustain them
consistently. How much more hardship can a small business owner experience that even the
big ones suffer too. Every business owner can be helped in any products they sell. There is a
need for them to be helped to increase their selling rate and prevent them from any
bankruptcy.""",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            """Nevertheless, even those who want to start a business can also be helped by giving ideas
and details to start their own. Also, having a legit transaction with a supplier is a must. Business
owners have trust issues in transacting, especially those new suppliers they met because they
do not want to waste their capital and time. After all, it can affect their customers too, so that
this issue will be fixed too.""",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Solutions',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                fontFamily: 'Montserrat'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            """During a pandemic, several of these issues arise, including business. As we can see, many businesses are
facing bankruptcy and are now shifting to online selling, particularly suppliers. We present the Davao
Gulf Suppliers web app, which will provide the following solutions:""",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            """A solution will be provided for the convenience of finding legitimate local suppliers in the Davao
Region.

1. It will provide a solution to the problem of being scammed on the online platform.

2. It will provide a solution regarding supplier recommendation for the person who is new to the
business.

3. It will provide a way to learn more about the supplier's information.""",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Differentiations',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                fontFamily: 'Montserrat'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            """This web application is intended for business owners to find legitimate suppliers as soon as
possible. We agreed to focus our users in the Davao region only. Any supplier from the Davao
region is welcome to register here to supply for their customers, and it can be rice, vegetables,
fruits, slippers, hardware, souvenirs, etc.""",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          Column(
            children: [
              if (_controller!.value.isInitialized) ...[
                FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: 500,
                    height: 250,
                    child: VideoPlayer(_controller!),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: VideoProgressIndicator(
                    _controller!,
                    allowScrubbing: true,
                    padding: const EdgeInsets.all(10),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(_controller!.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow),
                        onPressed: () {
                          setState(() {
                            _controller!.value.isPlaying
                                ? _controller!.pause()
                                : _controller!.play();
                          });
                        },
                      ),
                      Text(
                          '${convertToMinutesSeconds(videoPosition!)} / ${convertToMinutesSeconds(videoLength!)}'),
                      const SizedBox(width: 10),
                      Icon(animatedVolumeIcon(volume)),
                      Slider(
                        value: volume,
                        min: 0,
                        max: 1,
                        onChanged: (_volume) => setState(() {
                          volume = _volume;
                          _controller!.setVolume(_volume);
                        }),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.loop,
                          color: _controller!.value.isLooping
                              ? Colors.green
                              : Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              _controller!
                                  .setLooping(!_controller!.value.isLooping);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

String convertToMinutesSeconds(Duration duration) {
  final parsedMinutes = duration.inMinutes < 10
      ? '0${duration.inMinutes}'
      : duration.inMinutes.toString();

  final seconds = duration.inSeconds % 60;

  final parsedSeconds =
      seconds < 10 ? '0${seconds % 60}' : (seconds % 60).toString();
  return '$parsedMinutes:$parsedSeconds';
}

IconData animatedVolumeIcon(double volume) {
  if (volume == 0)
    return Icons.volume_mute;
  else if (volume < 0.5)
    return Icons.volume_down;
  else
    return Icons.volume_up;
}
