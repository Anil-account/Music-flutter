import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFlie extends StatefulWidget {
  final AudioPlayer advancePlayer ; 
  final String audioPath;
  const AudioFlie({ Key? key,  required this.advancePlayer,required this.audioPath }) : super(key: key);

  @override
  State<AudioFlie> createState() => _AudioFlieState();
}


class _AudioFlieState extends State<AudioFlie> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  
  bool isPlaying = false;
  bool isPause = false;
  bool isRepeat = false;
  bool isLoop = false;
  final String path = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

  final List <IconData> _icon = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];
  @override
  void initState() {
    super.initState();
    widget.advancePlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });
    widget.advancePlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });

    widget.advancePlayer.setUrl(path);
    widget.advancePlayer.onPlayerCompletion.listen((event) {
setState(() {
  _position = Duration(seconds: 0);
  if(isRepeat==true){
    isPlaying = true;
  }
  else{
    isPlaying = false;
    isRepeat = false;
  }
  
});
    });
  }

  Widget btnStart() {
    return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        icon:isPlaying==false?Icon(_icon[0], size:50, color:Colors.blue):Icon(_icon[1], size:50, color:Colors.blue),
        onPressed: (){
          widget.advancePlayer.play(path);
          // if(isPlaying==false) {
          //   widget.advancePlayer.play(widget.audioPath);
          //   setState(() {
          //     isPlaying = true;
          //   });
          // }else if(isPlaying==true){
          //   widget.advancePlayer.pause();
          //   setState(() {
          //     isPlaying=false;
          //   });
          // }
        },
    );
  }

  Widget btnslow(){
    return IconButton(
      icon: Icon(
        Icons.fast_rewind,
        color: Colors.black,
        size: 15,
      ),
      onPressed: () {
        // widget.advancePlayer.setPlaybackRate(playbackRate);
      },
    );
  }

Widget loadAsset(){
  return 
  Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
      btnStart(),
    ]
    ),
  );
}

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_position.toString().split(".")[0], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(_duration.toString().split(".")[0], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],),),
          loadAsset()    
        ],
      ),
      
 
    );
  }
}