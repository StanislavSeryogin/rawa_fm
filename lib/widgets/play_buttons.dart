import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rawa_fm/components/components.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    required this.playerState,
    required this.onPlayTap,
    required this.onPauseTap,
    required this.onReplayTap,
    Key? key,
  }) : super(key: key);

  final PlayerState playerState;
  final VoidCallback onPlayTap;
  final VoidCallback onPauseTap;
  final VoidCallback onReplayTap;

  @override
  Widget build(BuildContext context) {
    final processingState = playerState.processingState;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (processingState == ProcessingState.loading
            || processingState == ProcessingState.buffering)
          Container(
            margin: const EdgeInsets.all(8.0),
            width: 64.0,
            height: 64.0,
            child: const CircularProgressIndicator(
                color: AppColors.kTitleAndPlayAndBufferingColor),
          )
        else if (playerState.playing != true)
          IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 64.0,
            onPressed: onPlayTap,
          )
        else if (processingState != ProcessingState.completed)
          IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 64.0,
            onPressed: onPauseTap,
          )
        else
          IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 64.0,
            onPressed: onReplayTap,
          )
      ],
    );
  }
}
