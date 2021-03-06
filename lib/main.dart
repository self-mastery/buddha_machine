//import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '南無阿彌陀佛',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: '南無阿彌陀佛'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //AudioPlayer audioPlayer = AudioPlayer();
  //AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  //AudioCache audioCache = AudioCache(prefix: 'sounds/');

  //默认状态
  //AudioPlayerState _state = AudioPlayerState.STOPPED;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    //audioCache.fixedPlayer = audioPlayer;
    //audioPlayer.resume();

    _listenAudioPlayerStateController();
    //AudioPlayer.logEnabled = true;
    //print("initstate");

    _controller = VideoPlayerController.network(
        'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-58bc9f1d-f85f-4ade-a530-167b20c023d7/95957768-a5fe-4eaa-a596-b4a3b0f84aef.mp3')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

//  @override
//  void deactivate() async{
//    print('结束');
//    int result = await audioPlayer.release();
//    if (result == 1) {
//      print('release success');
//    } else {
//      print('release failed');
//    }
//    super.deactivate();
//  }

  floatingBtnClicked() async {
    //AudioPlayer audioPlayer = AudioPlayer();
    //await audioPlayer.setReleaseMode(ReleaseMode.STOP); // set release mode so that it never releases
    //await audioPlayer.play("https://vkceyugu.cdn.bspapp.com/VKCEYUGU-58bc9f1d-f85f-4ade-a530-167b20c023d7/95957768-a5fe-4eaa-a596-b4a3b0f84aef.mp3");
    //await audioPlayer.setUrl('clicking.mp3'); // prepare the player with this audio but do not start playing



    // 点击按钮时
    //await audioPlayer.resume(); // 快速播放声音，不会释放
    //    if (_state == AudioPlayerState.PLAYING) {
//      audioPlayer.pause();
//    } else if (_state == AudioPlayerState.PAUSED) {
//      audioPlayer.resume();
//    } else {
//      //audioPlayer = AudioPlayer();
//      audioPlayer.play("https://vkceyugu.cdn.bspapp.com/VKCEYUGU-58bc9f1d-f85f-4ade-a530-167b20c023d7/95957768-a5fe-4eaa-a596-b4a3b0f84aef.mp3");
//      //audioCache.loop('amtf.mp3');
//    }

    _controller.value.isPlaying
        ? _controller.pause()
        : _controller.play();
  }

  ///监听播放器当前状态
  _listenAudioPlayerStateController() {
//    //iOS
//    // if (Platform.isIOS) {
//    audioPlayer.onNotificationPlayerStateChanged
//        .listen((value) {
//      print("isIOS监听播放: $value");
//      _state = value;
//    });
    // }
    //android
    // if (Platform.isAndroid) {
//    audioPlayer.onPlayerStateChanged.listen((value) {
//      print("isAndroid监听播放: $value");
//      _state = value;
//    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
      //),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container (
            width: MediaQuery.of(context).size.width, // 屏幕宽度
            height: MediaQuery.of(context).size.height, // 屏幕高度
            child: Image.asset(
              "images/amtb.JPG",
              fit: BoxFit.cover,
            ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: floatingBtnClicked,
        tooltip: '控制中心',
        child: const Icon(Icons.menu),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
