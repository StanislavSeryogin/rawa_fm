import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rawa_fm/services/audio_player_service.dart';

import '../widgets/navigator_drawer_widget.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20),
              child: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: const Icon(
                      Icons.menu_rounded,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      body: SafeArea(
        child: GetBuilder<AudioPlayerService>(
          init: Get.put<AudioPlayerService>(AudioPlayerService()),
          builder: (controller) {
            final audioPlayer = controller.audioPlayer;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Expanded(
                    child: StreamBuilder<SequenceState?>(
                      stream: audioPlayer.sequenceStateStream,
                      builder: (context, snapshot) {
                        final state = snapshot.data;
                        if (state?.sequence.isEmpty ?? true) {
                          return Image.asset('assets/RAWA.FM_Logo.png');
                        }
                        return AudioPlayerService()
                            .buildInfoCarousel(controller, audioPlayer);
                      },
                    ),
                  ),
                StreamBuilder<PlayerState>(
                  stream: audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    return AudioPlayerService()
                        .buildPlayerButtons(snapshot, audioPlayer) ?? Container();
                  },
                ),
                const SizedBox(height: 10,)
              ],
            );
          },
        ),
      ),
    );
  }
}
