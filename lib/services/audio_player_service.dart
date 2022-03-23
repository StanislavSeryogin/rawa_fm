import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rawa_fm/models/api_radio.dart';
import 'package:rawa_fm/models/radio_modal.dart';

import '../widgets/info_carousel.dart';
import '../widgets/play_buttons.dart';

class AudioPlayerService extends FullLifeCycleController {
  late AudioPlayer audioPlayer;
  final _apiRadio = ApiRadio();
  final _playlist = ConcatenatingAudioSource(
    children: _radioUrls.map((url) => AudioSource.uri(Uri.parse(url))).toList(),
  );
  final List<MediaItem> mediaItems = [];

  final List<StreamSubscription<RadioModal>> _streamSubscriptions = [];

  static const _radioUrls = [
    "https://rawa.fm:8443/radio/8000/radio.mp3",
    "https://rawa.fm:8443/radio/8010/radio.mp3",
  ];

  @override
  void onInit() {
    _initPlayer();
    _setupListeners();
    super.onInit();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    for (final sub in _streamSubscriptions) {
      sub.cancel();
    }
    super.onClose();
  }

  Future<void> _initPlayer() async {
    audioPlayer = AudioPlayer();
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    audioPlayer.playbackEventStream.listen(
      (event) {},
      onError: (Object e, StackTrace stackTrace) {
        if (kDebugMode) {
          print('A stream error occurred: $e');
        }
      },
    );
    try {
      await audioPlayer.setAudioSource(_playlist);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print("Error loading playlist: $e");
      }
      if (kDebugMode) {
        print(stackTrace);
      }
    }
  }

  void _setupListeners() {
    final List<Stream<RadioModal>> streams = [
      _apiRadio.getRadio(1),
      _apiRadio.getRadio(2),
    ];

    for (int i = 0; i < streams.length; i++) {
      final stream = streams[i];
      _streamSubscriptions.add(
        stream.listen(
          (radio) {
            final mediaItem = MediaItem(
              id: '$i',
              artist: radio.artist,
              album: radio.playlist,
              title: radio.title,
              artUri: Uri.parse(radio.art),
            );
            if(mediaItems.length <= i) {
              mediaItems.add(mediaItem);
            } else {
              mediaItems[i] = mediaItem;
            }
            update();
          },
        ),
      );
    }
  }

  InfoCarousel buildInfoCarousel(AudioPlayerService controller, AudioPlayer audioPlayer) {
    return InfoCarousel(
      mediaItems: controller.mediaItems,
      onPageChanged: (index) => audioPlayer.seek(
        Duration.zero,
        index: index,
      ),
    );
  }

  PlayerButtons? buildPlayerButtons(AsyncSnapshot<PlayerState> snapshot,
      AudioPlayer audioPlayer) {
    if(snapshot.data == null) return null;
    return PlayerButtons(
      playerState: snapshot.data!,
      onPlayTap: audioPlayer.play,
      onPauseTap: audioPlayer.pause,
      onReplayTap: () => audioPlayer.seek(
        Duration.zero,
        index: audioPlayer.currentIndex,
      ),
    );
  }
}
