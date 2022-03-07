part of layout;

final destroySound = Player(id: 1);
final floatMusic = Player(id: 2);
// late ReceivePort _audioComPort;
// late SendPort _audioSendPort;
// late Isolate _audioIso;

void initSound() {
  destroySound.open(
    Media.asset(
      'assets/audio/destroy.wav',
    ),
    autoStart: false,
  );
  destroySound.setVolume(0.5);

  floatMusic.open(
    Media.asset(
      'assets/audio/Float.ogg',
    ),
    autoStart: false,
  );
  // _audioComPort = ReceivePort();
  // Isolate.spawn(
  //   _playSound,
  //   _audioComPort.sendPort,
  // ).then(
  //   (iso) {
  //     _audioIso = iso;
  //   },
  // );
  // _audioComPort.listen(
  //   (message) {
  //     if (message is SendPort) {
  //       _audioSendPort = message;
  //     }
  //   },
  // );
}

// void _playSound(SendPort port) {
//   final mainToIsolateStream = ReceivePort();
//   port.send(mainToIsolateStream.sendPort);

//   mainToIsolateStream.listen(
//     (audio) {
//       if (audio is Player) {
//         DartVLC.initialize();
//         audio.stop();
//         audio.play();
//       }
//     },
//   );
// }

void playSound(Player sound) {
  if (inBruteForce) return;
  if (sound.playback.isSeekable) {
    sound.seek(Duration.zero);
  }
  sound.play();
}

void playOnLoop(Player sound, double volume) {
  if (sound.playback.isSeekable) {
    sound.seek(Duration.zero);
  }
  sound.setPlaylistMode(PlaylistMode.loop);
  sound.setVolume(volume);
  sound.play();
}

void setLoopSoundVolume(Player sound, double volume) {
  if (volume == 0) {
    sound.stop();
  } else {
    if (sound.playback.isPlaying) {
      sound.setVolume(volume);
    } else {
      playOnLoop(sound, volume);
    }
  }
}
