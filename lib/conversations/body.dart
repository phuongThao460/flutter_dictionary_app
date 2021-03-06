// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dictionary_app/modules/conversation.dart';

class Body extends StatefulWidget {
  Conversation conversationData;
  Body({required this.conversationData});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final audioPlayer = AudioPlayer();
  var audioPlay;
  bool isPlaying = false;
  Uint8List? audiobytes;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String? audioasset;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  void initState() {
    if (!mounted) return;
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    super.initState();
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    ByteData bytes = await rootBundle.load(
        "assets/audio/${widget.conversationData.audio}"); //load audio from assets
    setState(() {
      audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          Text(
            widget.conversationData.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          ClipRRect(
            child: Image.asset(
              widget.conversationData.image,
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: 200,
            ),
          ),
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            activeColor: Colors.blue[300],
            inactiveColor: const Color(0xFF9921E8),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);
              await audioPlayer.resume();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position)),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: const Color(0xFF9921E8),
            radius: 35,
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
              iconSize: 50,
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  await audioPlayer.playBytes(audiobytes!);
                }
              },
            ),
          ),
          Padding(
          padding: const EdgeInsets.only(top:30.0),
          child:  Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300],
            ),
            child: Padding(padding: const EdgeInsets.all(10),
            child: Text(widget.conversationData.content,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
