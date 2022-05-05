import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:play/audio_play.dart';
import 'app_color.dart' as AppColor;

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({Key? key}) : super(key: key);

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  late AudioPlayer advancePlayer ;

   
  @override
  void initState() {
    super.initState();
    advancePlayer = AudioPlayer();
  }


  @override
  Widget build(BuildContext context) {
    final double screenHieght = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.audioBluishBackground,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height / 3,
              child: Container(
                color: AppColor.audioBlueBackground,
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search))
                ],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              )),
          Positioned(
            left: 0,
            right: 0,
            top: screenHieght * 0.2,
            height: screenHieght * 0.36,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHieght * 0.1,
                  ),
                  Text(
                    "Shape of you",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Ed Shreen",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AudioFlie(advancePlayer: advancePlayer, audioPath: '',),
                ],
              ),
            ),
          ),
          Positioned(
              top: screenHieght * 0.12,
              left: (screenWidth - 150) / 2,
              right: (screenWidth - 150) / 2,
              height: screenHieght * 0.16,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    color: AppColor.audioGreyBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                        image: const DecorationImage(
                            image: AssetImage("images/ed.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
